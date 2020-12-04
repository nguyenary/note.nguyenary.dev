<?php

namespace App\Http\Controllers;

use App\Models\Page;
use App\Models\Paste;
use App\Models\Syntax;
use Illuminate\Http\Request;
use Mail;
use Validator;

class PageController extends Controller
{

    public function show($slug)
    {
        $page = Page::where('slug', $slug)->where('active', 1)->firstOrfail();

        $old_page = \DB::table('pages')->where('slug',$slug)->where('active',1)->first();

        $result = json_decode($old_page->content);

        if (json_last_error() !== 0) {
            
            $page->title = $old_page->title;
            $page->content = $old_page->content;
            $page->save();
        }

        $description = trim(preg_replace('/\s+/', ' ', strip_tags($page->content)));

        $page->description = str_limit($description, 200, '');

        return view('front.page.show', compact('page'))->with('page_title', $page->title);
    }

    public function contact()
    {
        return view('front.page.contact')->with('page_title', __('Contact Us'));
    }

    public function contactPost(Request $request)
    {
        $captcha = '';
        if (config('settings.captcha') == 1) {
            if (config('settings.captcha_type') == 1) {
                $captcha = 'required|captcha';
            } else {
                $captcha = 'required|custom_captcha';
            }

        }

        $validator = Validator::make($request->all(), [
            'name' => 'required|eco_alpha_spaces|min:2|max:100',
            'email' => 'required|email|max:100',
            'message' => 'required|string|min:10|max:5000',
            'g-recaptcha-response' => $captcha,
        ]);
        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        } else {

            try {
                Mail::send('emails.contact', ['request' => $request], function ($m) {
                    $m->to(config('settings.site_email'))->subject(config('settings.site_name') . ' - ' . __('Contact Message'));
                });
            } catch (\Exception $e) {
                \Log::info($e->getMessage());
                return redirect('contact')->with('warning', __('Your message was not sent due to invalid mail configuration'));
            }

            return redirect('contact')->with('success', __('Your message successfully sent'));
        }

    }

    public function sitemaps()
    {
        $first_product = Paste::orderBy('created_at')->firstOrfail(['created_at']);

        $last_product = Paste::orderBy('created_at','DESC')->firstOrfail(['created_at']);

        $start_date = $first_product->created_at->format('Y-m-d');
        $end_date = $last_product->created_at->format('Y-m-d');

        return response()->view('front.page.sitemaps',compact('start_date','end_date'))->header('Content-Type', 'text/xml');
    }


    public function sitemapMain()
    {
        $pages = Page::where('active', 1)->get(['slug']);

        $syntaxes = Syntax::where('active', 1)->get(['slug']);
        return response()->view('front.page.sitemap_main', compact('pages', 'syntaxes'))->header('Content-Type', 'text/xml');
    }

    public function sitemap($date)
    {
        $pastes = Paste::where('status', 1)->where(function ($query) {
            $query->where('expire_time', '>', \Carbon\Carbon::now())->orWhereNull('expire_time');
        })->where(function ($query) {
            $query->orWhereNull('user_id');
            $query->orWhereHas('user', function ($user) {
                $user->whereIn('status', [0, 1]);
            });
        })->whereDate('created_at',$date)
        ->orderBy('created_at', 'DESC')->get(['id', 'slug']);

        $users = \App\User::where('status',1)->whereDate('created_at',$date)->orderBy('created_at','DESC')->get(['id','name','avatar','role','status','about','fb','tw','gp']);

        return response()->view('front.page.sitemap',compact('pastes','users'))->header('Content-Type', 'text/xml');
    }

    public function redirect(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'url' => 'required|url',
        ]);
        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator);
        } 
        $url = $request->url;
        return view('front.page.redirect',compact('url'))->With('page_title',__('Leaving').' '.config('settings.site_name'));
    }
}

<?php

namespace App\Http\Controllers;

use App\Models\Paste;
use App\Models\Syntax;

class HomeController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $recent_pastes = Paste::where('status', 1)->where(function ($query) {
            $query->where('expire_time', '>', \Carbon\Carbon::now())->orWhereNull('expire_time');
        })->where(function ($query) {
            $query->orWhereNull('user_id');
            $query->orWhereHas('user', function ($user) {
                $user->whereIn('status', [0, 1]);
            });
        })->orderBy('created_at', 'desc')->limit(config('settings.recent_pastes_limit'))->get(['title', 'syntax', 'slug', 'created_at', 'password', 'expire_time', 'views']);

        $popular_syntaxes = Syntax::where('active', 1)->where('popular', 1)->get(['name', 'slug','extension']);
        $syntaxes         = Syntax::where('active', 1)->where('popular', 0)->get(['name', 'slug','extension']);

        if (\Auth::check()) {
            $my_recent_pastes = Paste::where('user_id', \Auth::user()->id)->orderBy('created_at', 'desc')->limit(config('settings.my_recent_pastes_limit'))->get(['title', 'syntax', 'slug', 'created_at', 'password', 'expire_time', 'views']);
        } else {
            $my_recent_pastes = [];
        }

        $paste = new \stdClass();

        if(\Auth::check()) {
            $paste->title = (!empty(\Auth::user()->default_paste->title)) ? \Auth::user()->default_paste->title : "";
            $paste->status = (!empty(\Auth::user()->default_paste->status)) ? \Auth::user()->default_paste->status : "";
            $paste->syntax = (!empty(\Auth::user()->default_paste->syntax)) ? \Auth::user()->default_paste->syntax : config('settings.default_syntax');
            $paste->expire = (!empty(\Auth::user()->default_paste->expire)) ? \Auth::user()->default_paste->expire : "";
            $paste->password = (!empty(\Auth::user()->default_paste->password)) ? \Auth::user()->default_paste->password : "";
            $paste->encrypted = (!empty(\Auth::user()->default_paste->encrypted)) ? \Auth::user()->default_paste->encrypted : "";
             $paste->folder_id = (!empty(\Auth::user()->default_paste->folder_id)) ? \Auth::user()->default_paste->folder_id : "";
        }
        else{
            $paste->title = "";
            $paste->status = "";
            $paste->syntax = config('settings.default_syntax');
            $paste->expire = "";
            $paste->password = "";
            $paste->encrypted = "";
            $paste->folder_id = "";
        }

        return view('front.home.index', compact('my_recent_pastes', 'recent_pastes', 'syntaxes', 'popular_syntaxes','paste'));
    }
}

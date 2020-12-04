<?php

namespace App\Http\Middleware;

use Closure;

class EcoWeb
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(!empty(config('settings.blocked_ips')))
        {
            $ip = request()->ip();
            $blocked_ips = explode(',',config('settings.blocked_ips'));
            if(in_array($ip,$blocked_ips)){
                echo view('errors.blocked')->with('page_title', __('Your IP is blocked'));
                exit;                
            }
        }

        if(config('settings.maintenance_mode') == 1){
            session()->flash('warning',__('Site Under Maintenance'));
        }

        if(strpos($request->url(), '/index.php')){
            return redirect(env('APP_URL'));
        }  
                 
        if(\Auth::check()){
            if(\Auth::user()->role == 1){
                return $next($request);
            }
        }
        
        if(config('settings.maintenance_mode') == 1 && $request->route()->getName() != 'admin.login' && !$request->isMethod('post')){
            echo view('front.page.maintenance')->with('page_title', __('Site Under Maintenance'));
            exit;
        }

        if(\Auth::check())
        {
            if(\Auth::user()->status == 2){ 
                \Auth::logout();
                return redirect('/')->withErrors(__('Your account is banned'));
            }            
            if (\Auth::user()->status == 1  || !empty(\Auth::user()->email_verified_at)) {
                if(config('settings.captcha_for_verified_users') == 0) config(['settings.captcha'=>0]);
            }
        }

        return $next($request);
    }
}

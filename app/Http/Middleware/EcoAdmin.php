<?php

namespace App\Http\Middleware;

use Closure;

class EcoAdmin
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
        if (!\Auth::check()) {
            if ($request->ajax()) {
                return response()->json(['message' => __('You must login to perform this action')], 401);
            } else {
                abort(404);
            }
        }

        if ($request->user()->role != 1) {
            if ($request->ajax()) {
                 return response()->json(['message' => __('Permission denied')], 401);
            } else {
                abort(404);
            }

        }

        if(\Auth::user()->status == 2){ 
            \Auth::logout();
            return redirect('/')->withErrors(__('Your account is banned'));
        }

        return $next($request);
    }
}

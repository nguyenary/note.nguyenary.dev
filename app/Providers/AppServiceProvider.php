<?php

namespace App\Providers;

use Illuminate\Support\Facades\Schema;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */
    public function boot()
    {
        Schema::defaultStringLength(191);

        if (env('DB_DATABASE') == 'MY_DBNAME') {
            redirect('/install')->send();
        }

        if (starts_with(env('APP_URL', 'http'), 'https')) {
            \URL::forceScheme('https');
        }

        $settings = \App\Models\Setting::get(['key', 'value']);
        foreach ($settings as $setting) {
            \Config::set('settings.' . $setting->key, $setting->value);
        }

        /**
         * Validate ExistsInDatabase or 0/null
         */
        \Validator::extend(
            'exists_or_null',
            function ($attribute, $value, $parameters) {
                if ($value == 0 || is_null($value)) {
                    return true;
                } else {
                    $validator = Validator::make([$attribute => $value], [
                        $attribute => 'exists:' . implode(",", $parameters),
                    ]);
                    return !$validator->fails();
                }
            }
        );

        //Add this custom validation rule.
        \Validator::extend('eco_alpha_spaces', function ($attribute, $value) {

            // This will only accept alpha and spaces.
            // If you want to accept hyphens use: /^[\pL\s-]+$/u.
            return preg_match('/^[\pL\s]+$/u', $value);

        });

        //Add this custom validation rule.
        \Validator::extend('alpha_num_spaces', function ($attribute, $value) {
            return preg_match('/^[a-zA-Z0-9\s]+$/', $value);
        });        

        //Add this custom validation rule.
        \Validator::extend('eco_alpha_num_spaces', function ($attribute, $value) {
            return preg_match('/^[\p{L}\p{N}\040\]+$/u', $value);
        });

        \Validator::extend('eco_string', function ($attribute, $value) {
            if(config('settings.string_validation') == 2) return is_string($value);
            else return preg_match('/^[\p{L}\p{N}\040\_.-]+$/u', $value);
        });        

        \Validator::extend('eco_long_string', function ($attribute, $value) {
            if(config('settings.string_validation') == 2) return is_string($value);
            else return preg_match('/^[\p{L}\p{N}\r\t\n\040\_.-]+$/u', $value);
        });

        \Validator::extend('eco_color', function ($attribute, $value) {
            return preg_match('/#([a-f0-9]{3}){1,2}\b/i', $value);
        });

        $locales = \App\Models\Language::orderBy('name')->get(['name', 'code']);

        if (!session('language')) {
            \Config::set('app.locale', config('settings.default_locale'));
        }

        //Timezone
        \Config::set('app.timezone', config('settings.default_timezone'));
        date_default_timezone_set(config('settings.default_timezone'));

        //Recaptcha
        \Config::set('captcha.siteKey', config('settings.captcha_site_key'));
        \Config::set('captcha.secretKey', config('settings.captcha_secret_key'));

        if (empty(config('settings.captcha_site_key')) || empty(config('settings.captcha_secret_key'))) {
            if (config('settings.captcha_type') == 1) {
                \Config::set('settings.captcha', 0);
            }

        }

        //Mail
        \Config::set('mail.driver', config('settings.mail_driver'));
        \Config::set('mail.host', config('settings.mail_host'));
        \Config::set('mail.port', config('settings.mail_port'));
        \Config::set('mail.username', config('settings.mail_username'));
        \Config::set('mail.password', config('settings.mail_password'));
        \Config::set('mail.encryption', config('settings.mail_encryption'));
        \Config::set('mail.from.address', config('settings.mail_from_address'));
        \Config::set('mail.from.name', config('settings.mail_from_name'));

        //Socialite
        if(!empty(config('settings.FACEBOOK_CLIENT_ID')) && !empty(config('settings.FACEBOOK_CLIENT_SECRET'))){
            \Config::set('services.facebook.client_id', config('settings.FACEBOOK_CLIENT_ID'));
            \Config::set('services.facebook.client_secret', config('settings.FACEBOOK_CLIENT_SECRET'));
        }
        else{
            \Config::set('settings.social_login_facebook', 0);            
        }        
        if(!empty(config('settings.TWITTER_CLIENT_ID')) && !empty(config('settings.TWITTER_CLIENT_SECRET'))){
            \Config::set('services.twitter.client_id', config('settings.TWITTER_CLIENT_ID'));
            \Config::set('services.twitter.client_secret', config('settings.TWITTER_CLIENT_SECRET'));
        }
        else{
            \Config::set('settings.social_login_twitter', 0);            
        }   

        if(!empty(config('settings.GOOGLE_CLIENT_ID')) && !empty(config('settings.GOOGLE_CLIENT_SECRET'))){
            \Config::set('services.google.client_id', config('settings.GOOGLE_CLIENT_ID'));
            \Config::set('services.google.client_secret', config('settings.GOOGLE_CLIENT_SECRET'));
        }
        else{
            \Config::set('settings.social_login_google', 0);            
        }

        view()->share(compact('locales'));
    }

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        view()->composer(['*'], function ($view) {

            $my_folders = collect();
            if(\Auth::check())
            {                  
                $my_folders = \App\Models\Folder::where('user_id',\Auth::user()->id)->orderBy('name')->get();                    
            }
            $view->with('my_folders',$my_folders);
        });
    }
}

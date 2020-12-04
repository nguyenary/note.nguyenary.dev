@extends('front.layouts.default')

@section('meta')
<meta name="description" content="{{config('settings.meta_description')}}">
<meta name="keywords" content="{{config('settings.meta_keywords')}}">
@stop

@section('content')
<main>
  <div class="container">
    <div class="row justify-content-center">
      <div class="col-md-8">
        <div class="card">
          <div class="card-header h4 text-center">{{ __('Reset Password') }}</div>
          <div class="card-body">
            <form method="POST" action="{{ route('password.update') }}">
              @csrf
              <input type="hidden" name="token" value="{{ $token }}">
              <div class="form-group row">
                <label for="email" class="col-md-4 col-form-label text-md-right">{{ __('E-Mail Address') }}</label>
                <div class="col-md-6">
                  <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ $email ?? old('email') }}"  required autofocus>
                  @if ($errors->has('email')) <span class="invalid-feedback" role="alert"> <strong>{{ $errors->first('email') }}</strong> </span> @endif </div>
              </div>
              <div class="form-group row">
                <label for="password" class="col-md-4 col-form-label text-md-right">{{ __('Password') }}</label>
                <div class="col-md-6">
                  <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password"  required>
                  @if ($errors->has('password')) <span class="invalid-feedback" role="alert"> <strong>{{ $errors->first('password') }}</strong> </span> @endif </div>
              </div>
              <div class="form-group row">
                <label for="password-confirm" class="col-md-4 col-form-label text-md-right">{{ __('Confirm Password') }}</label>
                <div class="col-md-6">
                  <input id="password-confirm" type="password" class="form-control" name="password_confirmation"  required>
                </div>
              </div>

              
              @if(config('settings.captcha') == 1)
                    @if(config('settings.captcha_type') == 1) @captcha
                    @else
                      <div class="form-group row">
                        <label class="col-md-4 col-form-label text-md-right">{{ __('Security Check') }}</label>
                        <div class="col-md-6 input-group mb-3">

                          <div class="input-group-prepend">
                            <span class="input-group-text p-0"><img src="{{captcha_src(config('settings.custom_captcha_style'))}}" id="captchaCode" alt="" class="captcha"></span>
                          </div>
                          <input type="text" name="g-recaptcha-response" class="form-control" placeholder="{{ __('Security Check')}}" autocomplete="off" >

                          <div class="input-group-append">
                            <span class="input-group-text">
                            <a rel="nofollow" href="javascript:" onclick="document.getElementById('captchaCode').src='{{ url("captcha") }}/{{config('settings.custom_captcha_style')}}?'+Math.random()" class="refresh">
                              <i class="fa fa-refresh"></i>
                            </a>
                            </span>
                          </div>
                        </div>
                      </div>
                    @endif
                  @endif                         
              
              @include('front.includes.messages')
              <div class="form-group row mb-0">
                <div class="col-md-6 offset-md-4">
                  <button type="submit" class="btn btn-blue-grey" > {{ __('Reset Password') }} </button>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</main>
@endsection 
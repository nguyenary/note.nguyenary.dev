@extends('front.layouts.default')

@section('meta')
<meta name="description" content="{!!config('settings.meta_description')!!}">
<meta name="keywords" content="{!!config('settings.meta_keywords')!!}">
<meta name="author" content="{{config('settings.site_name')}}">

<meta property="og:title" content="@if(isset($page_title)){{$page_title.' - '}}@endif{{config('settings.site_name')}}" />
<meta property="og:type" content="website" />
<meta property="og:url" content="{{Request::url()}}" />
@if(!empty(config('settings.site_image')))
<meta property="og:image" content="{{url(config('settings.site_image'))}}" />
@endif
<meta property="og:site_name" content="{{config('settings.site_name')}}" />
<link rel="canonical" href="{{Request::url()}}" />
@stop

@section('after_scripts')
<script>
$(document).ready(function($) {
  
  var counter = 5;
  var interval = setInterval(function() {
      counter--;
      $('#time_seconds').text(counter);
      if (counter == 0) {
          $('#countdown').remove();
          $('#continue_link').removeClass('disabled');
          clearInterval(interval);
      }
  }, 1000);


});
</script>
@stop

@section('content')
<main> 
  <!--Main layout-->
<div class="container"> 
    @if(config('settings.ad') == 1 && !empty(config('settings.ad1')))
      <div class="row"> <div class="col-md-12 m-2 text-center">{!! html_entity_decode(config('settings.ad1')) !!}</div></div>
    @endif


  <div class="card m-5">
    <div class="card-header">
      {{ __('You are going to leave') }} {{ config('settings.site_name') }}
    </div>
  	<div class="card-body">
      <p>{{ __('You have clicked a link that will redirect you outside of') }} {{ config('settings.site_name') }}</p>
      <p><strong><a href="#">{{ $url }}</a></strong></p>

      <p class="text-center" id="countdown">{{ __('Please wait') }} <span id="time_seconds">5</span> {{ __('Seconds') }}...</p>
    </div>
    <div class="card-footer text-center">
        <a href="{{ url()->previous() }}" class="btn btn-primary btn-sm"> {{ __('Back') }}</a>
        <a href="{{ $url }}" class="btn btn-danger btn-sm disabled" id="continue_link"> {{ __('Continue') }}</a>
    </div>
  </div>

    @if(config('settings.ad') == 1 && !empty(config('settings.ad2')))
      <div class="row"> <div class="col-md-12 m-2 text-center">{!! html_entity_decode(config('settings.ad2')) !!}</div></div>
    @endif



  </div>
</main>
@stop 
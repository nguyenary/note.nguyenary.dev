@extends('front.layouts.default')

@section('after_scripts')
<script type="text/javascript">
var content = '';
var txt_copied = '{{ __("Copied")}}';
var txt_copy = '{{ __("Copy")}}';
</script>
@stop

@section('content')

@if(Auth::check() && Auth::user()->id == $folder->user_id)
	<main>
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					@include('front.user.sidebar')
				</div>
				<div class="col-md-9">
					@include('front.includes.messages')
					<div class="card">
						<div class="card-header d-flex justify-content-between">
							<span>
							  <i class="fa fa-folder-open"></i> {{ $page_title }} @if(request()->input('keyword')) | {{ __('Search Result').' - '.request()->input('keyword') }}@endif

										@if(config('settings.feature_share') == 1)
											<a class="badge badge-warning ml-2" data-toggle="modal" data-target="#shareModal"><i class="fa fa-share"></i> {{ __('share')}}</a> @endif

							  <a href="{{ route('folder.edit',[$folder->id]) }}" class="badge badge-info ml-3"><i class="fa fa-edit"></i> {{ __('Edit') }}</a>
							  <a href="{{ route('folder.delete',[$folder->id]) }}" class="badge badge-danger ml-1"><i class="fa fa-trash"></i> {{ __('Delete') }}</a>
							</span>
							<span>
							  <form action="">
								<div class="md-form form-sm m-0">
								  <input type="text" name="keyword" placeholder="{{ __('Search') }}" class="form-control form-control-sm pb-0 m-0 text-white card_search" value="{{ old('keyword',request()->input('keyword')) }}">
								</div>
							  </form>
							</span>
						</div>

						<ul class="list-group list-group-flush">
							@forelse($pastes as $paste)
								<li class="list-group-item">
									<div class="pull-left">
										<i class="fa fa-paste blue-grey-text small"></i> @if(!empty($paste->password))
											<i class="fa fa-lock pink-text small"></i>@endif @if(!empty($paste->expire_time))
											<i class="fa fa-clock-o text-warning small"></i> @endif
										<a href="{{$paste->url}}">{{$paste->title_f}}</a>
										<p><small class="text-muted">												
												<i class="fa fa-eye blue-grey-text"></i> {{$paste->views_f}} | {{$paste->created_ago}}
											</small>
										</p>
									</div>
									<div class="pull-right">
										<a href="{{url('paste/'.$paste->slug.'/edit')}}" class="badge badge-info mr-2"><i class="fa fa-edit"></i> {{ __('Edit')}}
										</a>
										<a href="{{url('paste/'.$paste->slug.'/delete')}}" class="badge badge-danger"><i class="fa fa-trash"></i> {{ __('Delete')}}
										</a>
									</div>
								</li>
							@empty
								<li class="list-group-item">{{ __('No results')}}</li>
							@endforelse
						</ul>
					</div>
					<div class="row">
						<div class=" mx-auto mt-3"> {{$pastes->links()}} </div>
					</div>
				</div>
			</div>
		</div>
	</main>
@else
	<main>
		<!--Main layout-->
		<div class="container">
			<!--First row-->
			<div class="row " data-wow-delay="0.2s">
				<div class="@if(config('settings.site_layout') == 1) col-md-9 @else col-md-12 @endif">
					@if(config('settings.ad') == 1 && !empty(config('settings.ad1')))
						<div class="col-md-12 m-2 text-center">{!! html_entity_decode(config('settings.ad1')) !!}</div>@endif
					<div class="card">
						<div class="card-header d-flex justify-content-between">
							<span>
							  <i class="fa fa-folder-open"></i> {{ $page_title }} @if(request()->input('keyword')) | {{ __('Search Result').' - '.request()->input('keyword') }}@endif
							  @if(config('settings.feature_share') == 1)
											<a class="badge badge-warning ml-2" data-toggle="modal" data-target="#shareModal"><i class="fa fa-share"></i> {{ __('share')}}</a> @endif
							</span>
							<span>
							  <form action="">
								<div class="md-form form-sm m-0">
								  <input type="text" name="keyword" placeholder="{{ __('Search') }}" class="form-control form-control-sm pb-0 m-0 text-white card_search" value="{{ old('keyword',request()->input('keyword')) }}">
								</div>
							  </form>
							</span>
						</div>

						<ul class="list-group list-group-flush">
							@forelse($pastes as $paste)
								<li class="list-group-item">
									<i class="fa fa-paste blue-grey-text small"></i> @if(!empty($paste->password))
										<i class="fa fa-lock pink-text small"></i>@endif @if(!empty($paste->expire_time))
										<i class="fa fa-clock-o text-warning small"></i> @endif
									<a href="{{$paste->url}}">{{$paste->title_f}}</a>
									<p><small class="text-muted">
											<i class="fa fa-eye blue-grey-text"></i> {{$paste->views_f}} | {{$paste->created_ago}}
										</small></p>
								</li>
							@empty
								<li class="list-group-item text-center">{{ __('No results')}}</li>
							@endforelse
						</ul>
					</div>
					<div class="row">
						<div class=" mx-auto mt-3 d-none d-sm-none d-md-block"> {{$pastes->appends(['keyword'=>app('request')->get('keyword')])->links()}} </div>							

						<div class=" mx-auto mt-3 d-sm-block d-md-none"> {{$pastes->appends(['keyword'=>app('request')->get('keyword')])->links('pagination::simple-bootstrap-4')}} </div>
					</div>
					@if(config('settings.ad') == 1 && !empty(config('settings.ad2')))
						<div class="col-md-12 m-2 text-center">{!! html_entity_decode(config('settings.ad2')) !!}</div>@endif
				</div>

				@include('front.paste.recent_pastes')	
			</div>
			<!--/.First row-->
		</div>
		<!--/.Main layout-->
	</main>
@endif



	@if(config('settings.feature_share') == 1)
		<!-- The Modal -->
		<div class="modal" id="shareModal">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">{{ __('Share')}}</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>
					<!-- Modal body -->
					<div class="modal-body text-center"> @if(config('settings.qr_code_share') == 1)
							<div class="mb-2">
								<img src="https://www.qrcoder.co.uk/api/v1/?size=4&text={{urlencode($folder->url)}}">
							</div>
						@endif
						<a href="#" onclick="MyWindow=window.open('https://www.facebook.com/dialog/share?app_id={{config('settings.facebook_app_id')}}&amp;display=popup&amp;href={{$folder->url}}','Facebook share','width=600,height=300'); return false;" class="btn btn-primary btn-sm waves-effect waves-light"><i class="fa fa-facebook"></i></a>
						<a href="#" onclick="MyWindow=window.open('https://twitter.com/share?url={{$folder->url}}','Twitt this','width=600,height=300'); return false;" class="btn btn-info btn-sm waves-effect waves-light"><i class="fa fa-twitter"></i></a>
						<a href="#" onclick="MyWindow=window.open('https://plus.google.com/share?url={{$folder->url}}','Google Plus share','width=600,height=300'); return false;" class="btn btn-pink btn-sm waves-effect waves-light"><i class="fa fa-google-plus"></i></a> @if(config('settings.feature_copy') == 1)
							<div class="form-group mt-3 mb-3">
								<small class="text-muted">{{ __('To share this paste please copy this url and send to your friends')}}</small>
								<div class="input-group">
									<div class="input-group-prepend">
										<button class="btn btn-md btn-blue-grey m-0 px-3 mb-1" type="button" onclick="copyToClip('{{ $folder->url }}','copy_share_link')">{{ __('Copy')}}</button>
									</div>
									<input type="text" class="form-control" value="{{ $folder->url }}" disabled>
								</div>
							
								<small class="green-text" id="copy_share_link"></small>
							</div>
						@endif </div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button class="btn btn-danger btn-sm" data-dismiss="modal">{{ __('Close')}}</button>
					</div>
				</div>
			</div>
		</div>
	@endif
@stop
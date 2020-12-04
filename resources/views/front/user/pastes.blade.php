@extends('front.layouts.default')

@section('content')
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
							  @if(request()->input('keyword')){{ __('Search Result').' - '.request()->input('keyword') }}@else{{ __('My Recent Pastes')}}@endif
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
												@if(isset($paste->language))
													<a href="{{$paste->language->url}}">{{$paste->language->name}}</a>
												@else{{$paste->syntax}}@endif |
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
@stop


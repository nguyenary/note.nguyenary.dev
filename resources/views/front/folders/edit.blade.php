@extends('front.layouts.default')

@section('content')
	<main>
		<!--Main layout-->
		<div class="container">
			<!--First row-->
			<div class="row">
				<div class="col-md-3">
					@include('front.user.sidebar')
				</div>
				<div class="col-md-9">
				@include('front.includes.messages')
				<!-- Material form register -->
					<div class="card">
						<h5 class="card-header"><i class="fa fa-folder-o"></i> {{ $page_title}}
						</h5>
						<!--Card content-->
						<div class="card-body  pt-0">
							<form class="p-3" method="post" enctype="multipart/form-data" action="">
								@csrf
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label>{{ __('Name')}} </label>
											<input type="text" name="name" class="form-control mb-4" value="{{old('name',$folder->name)}}" placeholder="{{__('Folder Name')}}" tabindex="1" autofocus>
										</div>
									</div>

								</div>


								<!-- Save button -->
								<button class="btn btn-blue-grey darken-5 btn-block" type="submit" tabindex="7">{{ __('Save')}}</button>
							</form>
							<!-- Default form contact -->
						</div>
					</div>
					<!-- Material form register -->
				</div>
			</div>
		</div>
	</main>

@stop

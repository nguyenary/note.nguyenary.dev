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
						<div class="card-header  d-flex justify-content-between">
							  <span>{{ $page_title }}</span>
							  <span> <a href="{{ route('folder.create') }}" class="badge badge-info"> <i class="fa fa-plus"></i> {{ __('Create Folder') }} </a> </span>
						</div>
						<div class="card-body">
							<div class="row">
								@forelse($folders as $folder)
									<div class="col-md-2 text-center">
										<a href="{{ $folder->url }}"><i class="blue-grey-text fa fa-folder fa-4x"></i><br/> <span>{{ $folder->name }}</span></a>
									</div>	
								@empty
									<div class="col-md-12"> {{ __('No results') }} </div>
								@endforelse
							</div>
						</div>	
					</div>

				</div>
			</div>
		</div>
	</main>
@stop


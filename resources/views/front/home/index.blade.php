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

@section('after_styles')
	@if(config('settings.paste_editor') == 'ace')
		<link rel="stylesheet" href="{{url('plugins/ace/css/ace.min.css')}}" />
	@elseif(config('settings.paste_editor') == 'codemirror')
		<link rel="stylesheet" href="{{url('plugins/codemirror-5.52.0/lib/codemirror.min.css')}}" />
		<style>.CodeMirror{ border:1px solid lightgray; }</style>
	@endif
@stop

@section('after_scripts')
@if(config('settings.paste_editor') == 'ace')
<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.3/ace.js" type="text/javascript" charset="utf-8"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.3/ext-modelist.js"></script>
<script>
    var mode = "text";
    var syntax = "Text";
    var syntax_extension = "txt";
    var text = "";
    var type = 1;
    var editor = ace.edit("editor");
    editor.$blockScrolling = Infinity;
    //editor.setValue(text, -1);
    editor.setShowPrintMargin(false);
    editor.setOptions({
        autoScrollEditorIntoView: true,
        wrap: true,
        minLines: paste_editor_height,
        maxLines: paste_editor_height,
		@if(config('settings.syntax_highlighter_line_numbers') == 0)
        showLineNumbers: false,
        showGutter: false
		@endif

    });
    editor.focus();

    $('button[type="submit"]').on('click', function (event) {
        $('input[name="content"]').val(editor.getValue());
    });

	$("select[name='syntax']").on("change", function () {

        var ext = $(this).find('option:selected').data('ext');
        var tempPath = "file." + ext;
        var modelist = ace.require("ace/ext/modelist");
        var tempMode = modelist.getModeForPath(tempPath).mode;
        editor.session.setMode(tempMode);

    });

    var ext = $("select[name='syntax']").find('option:selected').data('ext');
    var tempPath = "file." + ext;
    var modelist = ace.require("ace/ext/modelist");
    var tempMode = modelist.getModeForPath(tempPath).mode;
    editor.session.setMode(tempMode);
</script>
@elseif(config('settings.paste_editor') == 'codemirror')
<script src="{{url('plugins/codemirror-5.52.0/lib/codemirror.min.js')}}"></script>
<script src="{{url('plugins/codemirror-5.52.0/addon/mode/loadmode.js')}}"></script>
<script src="{{url('plugins/codemirror-5.52.0/addon/edit/matchbrackets.js')}}"></script>
<script src="{{url('plugins/codemirror-5.52.0/addon/fold/foldcode.js')}}"></script>
<script src="{{url('plugins/codemirror-5.52.0/addon/fold/foldgutter.js')}}"></script>
<script src="{{url('plugins/codemirror-5.52.0/mode/meta.js')}}"></script>
<script>
CodeMirror.modeURL = '{{url("plugins/codemirror-5.52.0")}}/mode/%N/%N.js';	
var syntax_extension = $("select[name='syntax']").find('option:selected').data('ext');
var editor = CodeMirror.fromTextArea(document.getElementById("editor"), {
	lineNumbers: true,
	lineWrapping: true,
    matchBrackets: true,
    styleActiveLine: true,
	mode: "text"
});

changeMode(syntax_extension);

function changeMode(ext)
{
	var info = CodeMirror.findModeByExtension(ext);	
	if (typeof info === 'undefined') {
		mime = 'text/plain';
		mode = null;
	}
	else{
		mime = info.mime;
		mode = info.mode
	}
 	editor.setOption("mode", mime);
    CodeMirror.autoLoadMode(editor, mode);
}

$("select[name='syntax']").on("change", function () {
	var ext = $(this).find('option:selected').data('ext');
	changeMode(ext);
});

$('button[type="submit"]').on('click', function (event) {
    $('input[name="content"]').val(editor.getValue());
});

</script>	

@endif
@stop

@section('content')
	<main>
		<!--Main layout-->
		<div class="container">
			<!--First row-->
			<div class="row " data-wow-delay="0.2s">
				<div class="@if(config('settings.site_layout') == 1) col-md-9 @else col-md-12 @endif">
					@if(config('settings.ad') == 1 && !empty(config('settings.ad1')))
						<div class="col-md-12 m-2 text-center">{!! html_entity_decode(config('settings.ad1')) !!}</div>
					@endif
					@include('front.includes.messages')
					<div class="card">
						<div class="card-body">
							<input id="paste_file" type="file" onchange="handleFileSelect(this);" style="display: none;" />
							<form method="post" action="{{route('paste.store')}}">
								@csrf
								<div class="form-group">
									<label class="font-weight-bold d-flex justify-content-between">
										<span>{{ __('New Paste')}} </span>
										<small><a id="load_file">{{ __('Browse') }}</a></small>
									</label>
									@if(config('settings.paste_editor') == 'ace')
										<textarea id="editor" class="hide">{{old('content')}}</textarea>
										<input name="content" type="hidden">
									@elseif(config('settings.paste_editor') == 'codemirror')
										<textarea id="editor" autofocus>{{old('content')}}</textarea>
										<input name="content" type="hidden">
									@else
										<textarea name="content" class="form-control" rows="{{ config('settings.paste_editor_height') }}"  autofocus>{{old('content')}}</textarea>
									@endif
								</div>
								<h5>{{ __('Paste Settings')}}
								</h5>
								<hr class="extra-margin" />

								<div class="row">
										<div class="form-group col-md-6">
											<label>{{ __('Paste Title')}} : <small
														class="text-muted">@if(config('settings.paste_title_required') == 0)
														[{{ __('Optional')}}] @endif
												</small> </label> <input type="text" name="title" class="form-control"
													placeholder="{{ __('Paste Title')}}" value="{{old('title',$paste->title)}}"
													>
										</div>										

										<div class="form-group col-md-6">
											<label>{{ __('Paste Folder')}} :
											<small class="text-muted">[{{ __('Optional')}}] @if(Auth::check())<a href="{{ route('folder.create') }}"><i class="fa fa-plus"></i> {{ __('Create Folder') }}</a>@endif</small> </label>
											@php $selected = old('folder_id',$paste->folder_id); @endphp
											<select class="form-control select2" name="folder_id"  @if(!Auth::check()) disabled @endif>
												<option value="" @if(!Auth::check()) title="{{ __('You must login to use this feature') }}" @endif>{{ __('Select')}}</option>
												<optgroup label="{{ __('My Folders')}}">
													@foreach($my_folders as $my_folder)
														<option value="{{$my_folder->id}}" @if($selected == $my_folder->id) selected @endif>{{$my_folder->name}}</option>
													@endforeach
												</optgroup>
											</select>

										</div>										
								</div>	

								<div class="row">
									<div class="col-md-6 form-group">
											<label>{{ __('Syntax Highlighting')}} :
												<small class="text-muted">[{{ __('Optional')}}] </small> </label>
											@php $selected = old('syntax',$paste->syntax); @endphp
											<select class="form-control select2" name="syntax" >
												<option value="none">{{ __('Select')}}
												</option>
												<optgroup label="{{ __('Popular Languages')}}">
													@foreach($popular_syntaxes as $syntax)
														<option value="{{$syntax->slug}}"
																data-ext="{{(!empty($syntax->extension))?$syntax->extension:'txt'}}"
																@if($selected == $syntax->slug) selected @endif>{{$syntax->name}}</option>
													@endforeach
												</optgroup>
												<optgroup label="{{ __('All Languages')}}">
													@foreach($syntaxes as $syntax)
														<option value="{{$syntax->slug}}"
																data-ext="{{(!empty($syntax->extension))?$syntax->extension:'txt'}}"
																@if($selected == $syntax->slug) selected @endif>{{$syntax->name}}</option>
													@endforeach
												</optgroup>
											</select>
										</div>
										<div class="col-md-6 form-group">
											<label>{{ __('Paste Expiration')}} :
												<small class="text-muted">[{{ __('Optional')}}] </small> </label>
											@php $selected = old('expire',$paste->expire); @endphp
											<select class="form-control" name="expire" >
												<option value="N" @if($selected == 'N') selected @endif>{{ __('Never')}}
												</option>
												<option value="SD"
														@if($selected == 'SD') selected @endif>{{ __('Self Destroy')}}
												</option>
												<option value="10M"
														@if($selected == '10M') selected @endif>{{ __('10 Minutes')}}
												</option>
												<option value="1H"
														@if($selected == '1H') selected @endif>{{ __('1 Hour')}}
												</option>
												<option value="1D"
														@if($selected == '1D') selected @endif>{{ __('1 Day')}}
												</option>
												<option value="1W"
														@if($selected == '1W') selected @endif>{{ __('1 Week')}}
												</option>
												<option value="2W"
														@if($selected == '2W') selected @endif>{{ __('2 Weeks')}}
												</option>
												<option value="1M"
														@if($selected == '1M') selected @endif>{{ __('1 Month')}}
												</option>
												<option value="6M"
														@if($selected == '6M') selected @endif>{{ __('6 Months')}}
												</option>
												<option value="1Y"
														@if($selected == '1Y') selected @endif>{{ __('1 Year')}}
												</option>
											</select>
										</div>									


								</div>			

								<div class="row">
									<div class="col-md-6 form-group">
											<label>{{ __('Paste Status')}} :
												<small class="text-muted">[{{ __('Optional')}}] </small> </label>
											@php $selected = old('status',$paste->status); @endphp
											<select class="form-control" name="status" >
												<option value="1" @if($selected == 1) selected @endif>{{ __('Public')}}
												</option>
												<option value="2"
														@if($selected == 2) selected @endif>{{ __('Unlisted')}}
												</option>
												<option value="3" @if(!Auth::check()) disabled
														@else  @if($selected == 3) selected @endif @endif>
													{{ __('Private')}} ({{ __('members only')}})
												</option>
											</select>
										</div>
									<div class="col-md-6 form-group">
											<label>{{ __('Password')}} :
												<small class="text-muted">[{{ __('Optional')}}] </small> </label>
											<input type="password" name="password" class="form-control" placeholder="{{ __('Password')}}"  value="{{old('password',$paste->password)}}">
									</div>
								</div>		

								<div class="row">										
										<div class="form-group col-md-6">
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input" id="encrypted" name="encrypted"  value="1" @if(old('encrypted',$paste->encrypted) == 1) checked @endif>
												<label class="custom-control-label" for="encrypted">{{ __('Encrypt Paste')}}</label>
												<span>(<small class="cp" title="{{ __('Protect your text by Encrypting and Decrypting any given text with a key that no one knows')}}">?</small>)</span>
											</div>
										</div>
									@if(config('settings.captcha') == 1)
										@if(config('settings.captcha_type') == 1) @captcha
										@else
											<div class="col-md-6">
												<div class="input-group mb-3">
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
									
								</div>
								<div class="row">
									<div class="form-group col-md-12">
										<button type="submit" class="btn btn-success"
												>{{ __('Create New Paste')}}
										</button>
									</div>
								</div>
							</form>
							@if(!Auth::check())
								<div class="alert alert-warning" role="alert">
									<i class="fa fa-info-circle"> </i> {{ __('You are currently not logged in')}}
									, {{ __('this means you can not edit or delete anything you paste')}}.
									<a href="{{url('register')}}">{{ __('Sign Up')}}
									</a> {{ __('or') }}
									<a href="{{url('login')}}">{{ __('Login')}}
									</a>
								</div>
							@endif
						</div>
					</div>
					@if(config('settings.ad') == 1 && !empty(config('settings.ad2')))
						<div class="col-md-12 m-2 text-center">{!! html_entity_decode(config('settings.ad2')) !!}
						</div>
					@endif
				</div>
				@include('front.paste.recent_pastes')
			</div>
			<!--/.First row-->
		</div>
		<!--/.Main layout-->
	</main>
@stop

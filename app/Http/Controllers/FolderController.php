<?php

namespace App\Http\Controllers;

use App\Models\Folder;
use App\Models\Paste;
use Illuminate\Http\Request;
use Validator;

class FolderController extends Controller
{

    public function show($slug,Request $request)
    {

        $folder = Folder::where('slug',$slug)->firstOrfail();

        $validator = Validator::make($request->all(), [
            'keyword' => 'nullable|min:2|max:100|eco_string',
        ]);
        if ($validator->fails()) {
            return redirect(route('user.pastes'))
                ->withErrors($validator);
        }

        $pastes = Paste::where('folder_id',$folder->id)->where(function ($query) {
            $query->orWhereNull('user_id');
            $query->orWhereHas('user', function ($user) {
                $user->whereIn('status', [0, 1]);
            });
        })->orderBy('created_at', 'DESC');

        if(\Auth::check())
        {   
            if(\Auth::user()->role != 1 || $folder->user_id != \Auth::user()->id) $pastes = $pastes->where('status',1);
        }
        else{
            $pastes = $pastes->where('status',1);
        }

        if (!empty($request->keyword)) {
            $search_term = $request->keyword;
            $pastes = $pastes->where(function ($q) use ($search_term) {
                $q->orWhere('title', 'like', $search_term . '%');
            });
        }

        $pastes = $pastes->paginate(10);

        $recent_pastes = Paste::where('status', 1)->where(function ($query) {
            $query->where('expire_time', '>', \Carbon\Carbon::now())->orWhereNull('expire_time');
        })->where(function ($query) {
            $query->orWhereNull('user_id');
            $query->orWhereHas('user', function ($user) {
                $user->whereIn('status', [0, 1]);
            });
        })->orderBy('created_at', 'desc')->limit(config('settings.recent_pastes_limit'))->get(['title', 'syntax', 'slug', 'created_at', 'password', 'expire_time', 'views']);


        if(\Auth::check() && \Auth::user()->role == 1 && \Auth::user()->id != $folder->user_id) return view('admin.folder.show', compact('folder','pastes','recent_pastes'))->with('page_title', $folder->name);        
        else return view('front.folders.show', compact('folder','pastes','recent_pastes'))->with('page_title', $folder->name);
    }

    public function create()
    {
        return view('front.folders.create')->with('page_title',__('Create Folder'));
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required|min:2|max:100|eco_string',
        ]);
        if ($validator->fails()) {
            return redirect(route('user.pastes'))
                ->withErrors($validator)->withInput();
        }  

        $folders_count = Folder::where('user_id',\Auth::user()->id)->count();

        if($folders_count >= config('settings.max_folders_per_user'))
        {
            return redirect()->back()->withErrors(__('You have reached maximum limit to create folders'))->withInput();
        }

        $folder = new Folder();
        $folder->name = $request->name;        
        $folder->user_id = \Auth::user()->id;
        $folder->save();
        $folder->slug = str_slug($request->name).'-'.$folder->id;
        $folder->save();
        return redirect()->back()->withSuccess(__('Folder succssfully created'));
    }    

    public function edit($id)
    {
        $folder = Folder::where('id',$id)->where('user_id',\Auth::user()->id)->firstOrfail();
        return view('front.folders.edit',compact('folder'))->with('page_title',__('Edit Folder'));
    }

    public function update($id,Request $request)
    {
        $folder = Folder::where('id',$id)->where('user_id',\Auth::user()->id)->firstOrfail();
        $validator = Validator::make($request->all(), [
            'name' => 'required|min:2|max:100|eco_string',
        ]);
        if ($validator->fails()) {
            return redirect(route('user.pastes'))
                ->withErrors($validator);
        }    

        $folder->name = $request->name;
        $folder->save();
        $folder->slug = str_slug($request->name).'-'.$folder->id;
        $folder->save();        
        return redirect()->back()->withSuccess(__('Folder succssfully updated'));
    }
    public function destroy($id)
    {
        $folder = Folder::where('id',$id)->where('user_id',\Auth::user()->id)->firstOrfail();
        Paste::where('folder_id',$id)->where('user_id',\Auth::user()->id)->update(['folder_id'=>null]);
        $folder->delete();
        return redirect(route('user.folders'))->withSuccess(__('Folder succssfully deleted'));
    }
}

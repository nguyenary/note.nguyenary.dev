<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Folder;
use App\Models\Paste;
use Datatables;
use Illuminate\Http\Request;
use Validator;

class FolderController extends Controller
{
    public function index()
    {
        return view('admin.folder.index')->with('page_title', 'Folders');
    }

    public function get(Request $request)
    {
        if ($request->ajax()) {
            $folders = Folder::select();
            return Datatables::of($folders)
                ->addColumn('name', function ($item) {
                    return '<a href="'.$item->url.'" target="_blank">'.$item->name.'</a>';

                })            
                ->addColumn('user', function ($item) {
                    return (isset($item->user)) ? '<a href="'.$item->user->url.'" target="_blank">'.$item->user->name.'</a>' : 'deleted user';

                })
                ->addColumn('action', function ($item) {
                    return '<a class="btn btn-sm btn-default" href="' . url('admin/folders/' . $item->id . '/edit') . '"><i class="fa fa-edit"></i> Edit</a> <a class="btn btn-sm btn-danger" href="' . url('admin/folders/' . $item->id . '/delete') . '"><i class="fa fa-trash"></i> Delete</a>';
                })
                ->make(true);
        }
    }

    public function create()
    {
        return view('admin.folder.create')->with('page_title', 'Folders');
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name'      => 'required|min:3|max:100|eco_string',
        ]);
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        } else {
            $folder            = new Folder();
            $folder->name      = $request->name;
            $folder->user_id = \Auth::user()->id;
            $folder->save();
            $folder->slug = str_slug($request->name).'-'.$folder->id;
            $folder->save();            
            return redirect()->back()->withSuccess('Successfully created.');
        }
    }

    public function edit($id)
    {
        $folder = Folder::findOrfail($id);
        return view('admin.folder.edit', compact('folder'))->with('page_title', 'Folders');
    }

    public function update($id, Request $request)
    {
        $folder    = Folder::where('id', $id)->firstOrfail();
        $validator = Validator::make($request->all(), [
            'name'      => 'required|min:3|max:100|eco_string',
        ]);
        if ($validator->fails()) {
            return redirect()->back()->withErrors($validator)->withInput();
        } else {
            $folder->name      = $request->name;
            $folder->save();
            $folder->slug = str_slug($request->name).'-'.$folder->id;
            $folder->save();
            return redirect()->back()->withSuccess('Successfully updated.');
        }
    }

    public function destroy($id)
    {
        Folder::where('id', $id)->delete();
        Paste::where('folder_id',$id)->update(['folder_id'=>null]);
        return redirect()->back()->withSuccess('Folder Successfully deleted.');
    }
}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Folder extends Model
{
     /*
    |--------------------------------------------------------------------------
    | GLOBAL VARIABLES
    |--------------------------------------------------------------------------
    */

    protected $table = 'folders';
    protected $primaryKey = 'id';
    public $timestamps = true;
    protected $guarded = ['id'];
    //protected $fillable = [];


    public function user()
    {
        return $this->hasOne('App\User','id','user_id');
    }   

    public function folder()
    {
        return $this->hasOne('App\Models\Folder','id','folder_id');
    }    

    public function pastes()
    {
        return $this->hasMany('App\Models\Paste','folder_id','id');
    }

    public function getURLAttribute()
    {
        return $this->attributes['url'] = route('folder.show',['slug'=>$this->slug]);
    }    
}



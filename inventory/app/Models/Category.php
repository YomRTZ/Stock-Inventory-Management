<?php

namespace App\Models;
use App\Models\Product;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Sanctum\HasApiTokens;
class Category extends Model
{
    use HasFactory,HasApiTokens;
    protected $table='categories';
    protected $fillable = ['name', 'description'];
    public function products()
    {
        return $this->hasMany(Product::class);
    }
}


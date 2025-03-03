<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
    protected $table='products';
    protected $fillable = ['product_name', 'description', 'category_id', 'supplier_id', 'price','quantity_in_stock'];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function supplier()
    {
        return $this->belongsTo(Supplier::class);
    }

    // public function transactions()
    // {
    //     return $this->hasMany(Transaction::class);
    // }

    // public function stockAdjustments()
    // {
    //     return $this->hasMany(StockAdjustment::class);
    // }
}

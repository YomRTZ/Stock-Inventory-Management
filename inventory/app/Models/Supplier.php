<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Laravel\Sanctum\HasApiTokens;
class Supplier extends Model
{
    /** @use HasFactory<\Database\Factories\SupplierFactory> */
    use HasFactory,HasApiTokens;
    protected $table='suppliers';
    protected $fillable = ['name', 'email', 'phone', 'address'];
    public function transactions()
    {
        return $this->hasMany(Transaction::class);
    }
}

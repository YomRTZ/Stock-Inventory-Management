<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ProductResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        // return parent::toArray($request);
       
        return [
            'id' => $this->id,
            'product_name' => $this->product_name,
            'description' => $this->description,
            'category' => [
                'id' => $this->category->id,
                'name' => $this->category->name,
            ],
            'supplier' => [
                'id' => $this->supplier->id,
                'name' => $this->supplier->name,
            ],
            'price' => $this->price,
            'quantity_in_stock' => $this->quantity_in_stock,
            'created_at' => $this->created_at->format('Y-m-d H:i:s'),
            'updated_at' => $this->updated_at->format('Y-m-d H:i:s'),
        ];
       
    }
}

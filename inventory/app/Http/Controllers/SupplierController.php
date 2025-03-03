<?php

namespace App\Http\Controllers;

use App\Models\Supplier;
use App\Http\Resources\SuplierResource;
use App\Http\Requests\StoreSupplierRequest;
use App\Http\Requests\UpdateSupplierRequest;

class SupplierController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        $suppliers = Supplier::all();
        return SuplierResource::collection($suppliers);
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
       
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreSupplierRequest $request)
    {
        //
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'nullable|string',
            'phone' => 'nullable|string',
            'address' => 'nullable|string',
        ]);
    
        $suppliers = Supplier::create($validated);
        return new SuplierResource($suppliers);
    }

    /**
     * Display the specified resource.
     */
    public function show(Supplier $supplier)
    {
        //
        return new SuplierResource($supplier);
      
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Supplier $supplier)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateSupplierRequest $request, Supplier $supplier)
    {
        //
        $supplier->update($request->all());
        return new SuplierResource($supplier);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Supplier $supplier)
    {
        //
        $supplier->delete();
        return response()->noContent();
    }
}

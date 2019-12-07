<?php

namespace App\Exceptions;

use Exception;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Illuminate\Validation\ValidationException;

class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that are not reported.
     *
     * @var array
     */
    protected $dontReport = [
        //
    ];

    /**
     * A list of the inputs that are never flashed for validation exceptions.
     *
     * @var array
     */
    protected $dontFlash = [
        'password',
        'password_confirmation',
    ];

    /**
     * Report or log an exception.
     *
     * @param  \Exception  $exception
     * @return void
     */
    public function report(Exception $exception)
    {
        parent::report($exception);
    }

    /**
     * Render an exception into an HTTP response.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Exception  $exception
     * @return \Illuminate\Http\Response
     */
    public function render($request, Exception $exception)
    {
        if($exception->getMessage() == 'Too Many Attempts.'){
            $data = [
                'code' => 429,
                'message' => '请求频繁',
            ];

            return response()->json($data, 200);
        }

        if ($exception->getMessage() == "Unauthenticated.") {
            $data = [
                'code' => 401,
                'message' => $exception->getMessage(),
            ];

            return response()->json($data, 200);
        }

        if (request()->is("api/*")){
            if($exception instanceof ValidationException){
                $errors = $exception->validator->errors()->first();

                $data = [
                    'code' => 422,
                    'message' => $errors,
                ];

                return response()->json($data, 200);
            }
        }

        return parent::render($request, $exception);
    }
}

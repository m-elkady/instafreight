<?php

declare(strict_types=1);

class Insurance
{
    private $providers;
    // refine the api url variable naming to be camelCase
    private $apiUrl = 'http://demo9084693.mockable.io/';

    // adding parameter type hint and using optional operator
    public function __construct(?array $providers)
    {
        // using class constructor to inject the provider array if it is not exist
        // to reduce the responsibilities in the quote function
        // and using coalesce operator to reduce code blocks
        $this->providers = $providers ?? ['bank', 'insurance-company'];
    }

    //adding return type hint
    public function quote(): array
    {
        $quote = [];

        for ($i = 0; $i < count($this->providers); $i++) {
            // refine using the array elements
            $type = $this->providers[$i];
            switch ($type) {
                case 'bank':
                    $prices = file_get_contents($this->apiUrl . 'bank');
                    $quote[$type] = $prices;
                    //put break statement
                    break;
                case 'insurance-company':
                    $curl = curl_init();
                    curl_setopt_array($curl, [
                        CURLOPT_RETURNTRANSFER => 1,
                        CURLOPT_URL => $this->apiUrl . 'insurance',
                        CURLOPT_POST => 1,
                        CURLOPT_POSTFIELDS => [
                            'month' => 3,
                        ]
                    ]);
                    $prices = json_decode(curl_exec($curl));
                    curl_close($curl);
                    $quote[$type] = $prices;
                    break;
                //put default statement
                default:
                    break;
            }
            //transfer the add to quote statement to prevent adding null if providers array doesn't have our 2 types
        }

        return $quote;
    }
}
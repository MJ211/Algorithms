/******************************************************************************

                              Online C++ Compiler.
               Code, Compile, Run and Debug C++ program online.
Write your code in this editor and press "Run" button to compile and execute it.

*******************************************************************************/
#include <iostream>
#include <vector>

template<typename T>
std::ostream& operator<<(std::ostream& l_output, const std::vector<T>& p_result)
{
    l_output << "Result of quickSort: { ";
    
    for(auto l_elem : p_result)
    {
        l_output << l_elem <<" ";
    }
    
    l_output << "}" << std::endl;
    return l_output;
}

template<typename T>
void quickSortRecursionWithWeights(std::vector<T>& p_arr, std::vector<float>& p_weights, int p_begin, int p_end)
{
    if(p_begin >= p_end)
    {
        return;
    }

    int l_pivot = p_end;
    int l_boundary = p_begin;
    
    for(auto l_it = p_begin; l_it < p_end; ++l_it)
    {
        if(p_weights[l_it] < p_weights[l_pivot] or std::abs(p_weights[l_it] - p_weights[l_pivot]) < 0.0001)
        {
            std::swap(p_arr[l_it], p_arr[l_boundary]);
            std::swap(p_weights[l_it], p_weights[l_boundary]);
            ++l_boundary;
        }
    }
    std::swap(p_arr[l_boundary], p_arr[l_pivot]);
    std::swap(p_weights[l_boundary], p_weights[l_pivot]);
    
    quickSortRecursionWithWeights(p_arr, p_weights, p_begin, l_boundary-1); 
    quickSortRecursionWithWeights(p_arr, p_weights, l_boundary, p_end);
}


template<typename T>
void quickSortRecursion(typename std::vector<T>::iterator p_begin, 
                        typename std::vector<T>::iterator p_end)
{
    if(p_begin == p_end)
    {
        return;
    }
    auto l_pivot = p_end - 1;
    auto l_boundary = p_begin;
    
    for(auto l_it = p_begin; l_it != p_end - 1; ++l_it)
    {
        if(*l_it < *l_pivot)
        {
            std::iter_swap(l_it, l_boundary);
            ++l_boundary;
        }
    }
    std::iter_swap(l_boundary, l_pivot);
    
    quickSortRecursion<T>(p_begin, l_boundary); 
    quickSortRecursion<T>(l_boundary+1, p_end);
    
}

template<typename T>
std::vector<T> quickSort(std::vector<T>& p_arr, std::vector<float>& p_weights)
{
    if(not p_weights.empty() and (p_arr.size() == p_weights.size()))
    {
        quickSortRecursionWithWeights<T>(p_arr, p_weights, 0, p_arr.size() - 1);
        std::cout << p_weights;
        return p_arr; 
    }
    
    quickSortRecursion<T>(p_arr.begin(), p_arr.end());
    return p_arr; 
}

int main()
{
    std::vector<int> l_arr = {1,2,8,4,5,10,7,8};
    std::vector<float> l_weights = {22.135, 623.123, 394.132, 100, 9283.1, 11.5, 92.7, 826.2};
    std::cout << quickSort<int>(l_arr, l_weights);

    return 0;
}

//
// Created by zahorack on 11/17/19.
//

#include <stdint.h>

#ifndef CIRCULAR_H
#define CIRCULAR_H


typedef struct
{
    void *buffer;       // data buffer
    void *buffer_end;   // end of data buffer
    int capacity;       // maximum number of items in the buffer
    int count;          // number of items in the buffer
    int size;           // size of each item in the buffer
    void *head;         // pointer to head
    void *tail;         // pointer to tail
} circularBuffer_t;

void circular_buffer_init(circularBuffer_t *cb, int capacity, int size);
void circular_buffer_deinit(circularBuffer_t *cb);

void circular_buffer_push(circularBuffer_t *cb, const void *item);
void circular_buffer_pop(circularBuffer_t *cb, void *item);

void circular_buffer_peek(circularBuffer_t *cb, void *item);
void circular_buffer_value_at(circularBuffer_t *cb, void *item, int position);


#endif //CIRCULAR_H

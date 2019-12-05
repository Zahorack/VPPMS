//
// Created by zahorack on 11/17/19.
//

#include "circular.h"
#include <stdlib.h>
#include <string.h>
#include <stdio.h>

void circular_buffer_init(circularBuffer_t *cb, int capacity, int size)
{
    cb->buffer = malloc(capacity * size);

    if(cb->buffer == NULL) {
        // handle error
        printf("Circular buffer Memory error!\n");
    }

    cb->buffer_end = (char *)cb->buffer + capacity * size;
    cb->capacity = capacity;
    cb->count = 0;
    cb->size = size;
    cb->head = cb->buffer;
    cb->tail = cb->buffer;
}

void circular_buffer_deinit(circularBuffer_t *cb)
{
    free(cb->buffer);
}

void circular_buffer_push(circularBuffer_t *cb, const void *item)
{
    if(cb->count == cb->capacity){
        // handle error
        printf("Circular buffer error!\n");
    }
    memcpy(cb->head, item, cb->size);
    cb->head = (char*)cb->head + cb->size;

    if(cb->head == cb->buffer_end)
        cb->head = cb->buffer;

    cb->count++;
}

void circular_buffer_pop(circularBuffer_t *cb, void *item)
{
    if(cb->count == 0){
        // handle error
    }
    memcpy(item, cb->tail, cb->size);
    cb->tail = (char*)cb->tail + cb->size;

    if(cb->tail == cb->buffer_end)
        cb->tail = cb->buffer;
    cb->count--;
}

void circular_buffer_peek(circularBuffer_t *cb, void *item)
{
    memcpy(item, cb->head, cb->size);
}

void circular_buffer_value_at(circularBuffer_t *cb, void *item, int position) {
    if(cb->count == 0){
        // handle error
        printf("Circular buffer error!\n");
    }

    if((cb->tail + position * cb->size) >= cb->buffer_end) {
        memcpy(item, cb->buffer + (cb->tail + position*cb->size - cb->buffer_end), cb->size);
    }
    else
        memcpy(item, cb->tail + position*cb->size, cb->size);
}
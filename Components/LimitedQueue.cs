using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Components
{
    public class LimitedQueue<T> : IEnumerable<T>
    {
        private Queue<T> _queue = new Queue<T>();

        private int _maxCount;

        public LimitedQueue(int maxCount)
        {
            _maxCount = maxCount;
        }

        public void Enqueue(T item)
        {
            _queue.Enqueue(item);

            if (_queue.Count > _maxCount)
            {
                _queue.Dequeue();
            }
        }

        public IEnumerator<T> GetEnumerator()
        {
            return _queue.GetEnumerator();
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return (IEnumerator)_queue.GetEnumerator();
        }
    }
}

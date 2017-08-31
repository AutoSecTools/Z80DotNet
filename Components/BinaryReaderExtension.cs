using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Components
{
    public static class BinaryReaderExtension
    {
        public static TEnum ReadEnum<TEnum>(this BinaryReader reader)
            where TEnum : struct
        {
            if (!typeof(TEnum).IsEnum)
            {
                throw new ArgumentException();
            }

            var t = Enum.GetUnderlyingType(typeof(TEnum));

            if (t == typeof(byte))
            {
                return (TEnum)(ValueType)reader.ReadByte();
            }
            else if (t == typeof(ushort))
            {
                return (TEnum)(ValueType)reader.ReadUInt16();
            }
            else if (t == typeof(uint))
            {
                return (TEnum)(ValueType)reader.ReadUInt32();
            }
            else if (t == typeof(ulong))
            {
                return (TEnum)(ValueType)reader.ReadUInt64();
            }
            else
            {
                throw new ArgumentException();
            }
        }
    }
}

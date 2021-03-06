﻿using System;
using Bit.Core.Models.Table;
using System.Collections.Generic;
using System.Linq;

namespace Bit.Core.Models.Api
{
    public class CollectionUserCollectionRequestModel
    {
        public string UserId { get; set; }
        public IEnumerable<Collection> Collections { get; set; }

        public IEnumerable<CollectionUser> ToCollectionUsers()
        {
            return Collections.Select(c => new CollectionUser
            {
                OrganizationUserId = new Guid(UserId),
                CollectionId = new Guid(c.CollectionId),
                ReadOnly = c.ReadOnly
            });
        }

        public class Collection
        {
            public string CollectionId { get; set; }
            public bool ReadOnly { get; set; }
        }
    }

    public class CollectionUserUserRequestModel
    {
        public string UserId { get; set; }
        public bool ReadOnly { get; set; }
    }
}

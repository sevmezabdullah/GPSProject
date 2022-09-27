﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Core.Entites.Concrete;
using Core.Utilities.Results;

namespace Business.Abstract
{
    public interface IUserService
    {
        void Add(User user);
        User GetByMail(string email);
        User GetById(int id);
        IResult Update(User user);
        IResult UpdatePassword(string email,string newPassword);
        IResult Delete(User user);
    }
}

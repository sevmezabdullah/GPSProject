﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Business.Abstract;
using Business.BusinessAspects.Autofac;
using Business.ValidationRules.FluentValidation;
using Core.Aspects.Autofac.Validation;
using Core.Entites.Concrete;
using Core.Utilities.Results;
using DataAccess.Abstract;

namespace Business.Concrete
{
    public class UserManager:IUserService
    {
        IUserDal _userDal;

        public UserManager(IUserDal userDal)
        {
            _userDal = userDal;
        }

       
        public void Add(User user)
        {
            _userDal.Add(user);
        }

        public User GetByMail(string email)
        {
            return _userDal.Get(u => u.Email == email);
        }

        public User GetById(int id)
        {
            return _userDal.Get(u => u.Id == id);
        }

        public IResult Update(User user)
        {
              _userDal.Update(user);
            return new SuccessResult("kullanıcı güncellendi");
         
        }

        public IResult Delete(User user)
        {
            _userDal.Delete(user);
            return new SuccessResult("kullanıcı silindi");
        }

        public IResult UpdatePassword(string email,string newPassword)
        {
            var user = _userDal.Get(c=>c.Email==email);
            if (user!=null)
            {
                user.Password = newPassword;
            }
            _userDal.Update(user);
            return new SuccessResult("Şifre Güncellendi");
        }
    }
}

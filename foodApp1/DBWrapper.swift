//
//  DBWrapper.swift
//  foodApp1
//
//  Created by Felix ITS 003 on 27/12/18.
//  Copyright © 2018 ankita. All rights reserved.
//

import UIKit
import SQLite3
class DBWrapper: NSObject {
    var db: OpaquePointer?
    var dstmt: OpaquePointer?
    var loginArray: [String]?
    var PasswordArray: [String]?
    static let sharedObject = DBWrapper()
    func getDatabasePath()-> String
    {
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let path = docDir.first!
        return path + "/mobiSkribe.sqlLite"
    }
    func selectTask(query: String)
    {
        loginArray = [String]()
        PasswordArray = [String]()
        let dbPath = getDatabasePath()
        if(sqlite3_open(dbPath, &db) == SQLITE_OK)
        {
            if(sqlite3_prepare_v2(db, query, -1, &dstmt, nil) == SQLITE_OK)
            {
                if(sqlite3_step(dstmt) == SQLITE_ROW)
                {
                    let loginInc = sqlite3_column_text(dstmt!, 1)
                    let loginName = String(cString: loginInc!)
                    loginArray?.append(loginName)
                    let passwordInc = sqlite3_column_text(dstmt!, 1)
                    let passwordName = String(cString: passwordInc!)
                    PasswordArray?.append(passwordName)
                    print(loginArray!)
                    print(PasswordArray!)
                    
                }
                else
                {
                    print("Error is executing Statement \(sqlite3_errmsg(db!))")
                }
            }
            else
            {
                print("Error is preparing Statement \(sqlite3_errmsg(self.db!))")
            }
        }
        else
        {
            print("Error is noopening Statement \(sqlite3_errmsg(db!))")
        }
        
        
    }
    func executeQuery(query: String)->Bool
    {
        var success:Bool = false
        let dbPath = getDatabasePath()
        if(sqlite3_open(dbPath, &db) == SQLITE_OK)
        {
            if(sqlite3_prepare_v2(db, query, -1, &dstmt, nil) == SQLITE_OK)
            {
                if(sqlite3_step(dstmt) == SQLITE_DONE)
                {
                    success = true
                    sqlite3_finalize(dstmt!)
                    sqlite3_close(db!)
                }
                else
                {
                    print("Error is executing Statement \(sqlite3_errmsg(db!))")
                }
            }
            else
            {
                print("Error is preparing Statement \(sqlite3_errmsg(self.db!))")
            }
        }
        else
        {
            print("Error is noopening Statement \(sqlite3_errmsg(db!))")
        }
        return success
        
    }
    
    func creaTable()
    {
        //let delete = "drop table login"
        let createQuery = "create table if not exists login(userName text,EmailId text,password text)"
        let isSuccess = executeQuery(query: createQuery)
        if isSuccess{
            print("Create:Success")
        }
        else
        {
            print("Create:Failed")
        }
    }

}

Xcode 证书和Provision Profile
------
- Identifiers 是用来标识app的，原则上一个app使用一个Identifiers，相同Identifier的app装到手机上会被覆盖。
- Certificates 是证书。
- Devices就是你的设备，登记到账号下的设备UUID，给Provisioning Profiles用的。
- Provisioning Profiles是一个配置集合，指定了“哪个App” 由“哪个证书签名”，允许运行在“哪些设备”上。
![executable](https://github.com/iandai/iOSTechNote/CertificateAndProvisionProfile/raw/master/img1.png)
- code signing identity是在双击UNIQLO_App_global_enterprise.mobileprovision之后，自动安装到Keychain Access中的带有private_key的证书。这个证书会在Xcode中的code signing中的code signing identity中出现。
![executable](https://github.com/iandai/raw/master/CertificateAndProvisionProfile/img2.png)
![executable](https://github.com/iandai/raw/master/CertificateAndProvisionProfile/img3.png)


Reference
-----------------
- [iOS Provisioning Profile(Certificate)与Code Signing详解](http://blog.csdn.net/phunxm/article/details/42685597) 
- [Inside Code Signing](http://www.objc.io/issue-17/inside-code-signing.html)
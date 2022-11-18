Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB9D29B2
	for <chrome-platform@lists.linux.dev>; Fri, 18 Nov 2022 10:19:04 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NDCMX2lHtzqSMb;
	Fri, 18 Nov 2022 18:15:04 +0800 (CST)
Received: from [10.174.178.41] (10.174.178.41) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 18:18:54 +0800
Message-ID: <2d89c054-9962-bd8a-9180-6a72545cf7e8@huawei.com>
Date: Fri, 18 Nov 2022 18:18:53 +0800
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] platform/chrome: cros_usbpd_notify: Fix error handling in
 cros_usbpd_notify_init()
To: Prashant Malani <pmalani@chromium.org>
CC: <bleung@chromium.org>, <gwendal@chromium.org>, <jflat@chromium.org>,
	<chrome-platform@lists.linux.dev>
References: <20221117080823.77549-1-yuancan@huawei.com>
 <CACeCKafbbVsLrprzvVzsVgUUwExf==Ck-SOhQ2RCZbMVAnHuJg@mail.gmail.com>
From: Yuan Can <yuancan@huawei.com>
In-Reply-To: <CACeCKafbbVsLrprzvVzsVgUUwExf==Ck-SOhQ2RCZbMVAnHuJg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.41]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected


在 2022/11/18 3:07, Prashant Malani 写道:
> Hi Yuan,
>
> On Thu, Nov 17, 2022 at 12:10 AM Yuan Can <yuancan@huawei.com> wrote:
>> The following WARNING message was given when rmmod cros_usbpd_notify:
>>
>>   Unexpected driver unregister!
>>   WARNING: CPU: 0 PID: 253 at drivers/base/driver.c:270 driver_unregister+0x8a/0xb0
>>   Modules linked in: cros_usbpd_notify(-)
>>   CPU: 0 PID: 253 Comm: rmmod Not tainted 6.1.0-rc3 #24
>>   ...
>>   Call Trace:
>>    <TASK>
>>    cros_usbpd_notify_exit+0x11/0x1e [cros_usbpd_notify]
>>    __x64_sys_delete_module+0x3c7/0x570
>>    ? __ia32_sys_delete_module+0x570/0x570
>>    ? lock_is_held_type+0xe3/0x140
>>    ? syscall_enter_from_user_mode+0x17/0x50
>>    ? rcu_read_lock_sched_held+0xa0/0xd0
>>    ? syscall_enter_from_user_mode+0x1c/0x50
>>    do_syscall_64+0x37/0x90
>>    entry_SYSCALL_64_after_hwframe+0x63/0xcd
>>   RIP: 0033:0x7f333fe9b1b7
>>
>> The reason is that the cros_usbpd_notify_init() does not check the return
>> value of platform_driver_register(), and the cros_usbpd_notify can
>> install successfully even if platform_driver_register() failed.
>>
>> Fix by checking the return value of platform_driver_register() and
> Can you provide details regarding why cros_usbpd_notify_acpi_driver registration
> is failing on your system (logs or other details) ?

The reason could be an OOM happend when platform_driver_register() tries 
to allocate memory,

a simple call graph:

  platform_driver_register()
    driver_register()
      bus_add_driver()
        dev = kzalloc(...) # OOM happened

-- 
Best regards,
Yuan Can


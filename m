Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048C97B
	for <chrome-platform@lists.linux.dev>; Wed, 23 Nov 2022 08:33:11 +0000 (UTC)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NHDrx0GlMzHw58;
	Wed, 23 Nov 2022 16:32:33 +0800 (CST)
Received: from [10.174.178.41] (10.174.178.41) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 23 Nov 2022 16:33:09 +0800
Message-ID: <4abd6f64-34ee-80e4-c5b5-b70f26000175@huawei.com>
Date: Wed, 23 Nov 2022 16:33:08 +0800
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
 <2d89c054-9962-bd8a-9180-6a72545cf7e8@huawei.com>
 <CACeCKaevCdGYkC0+3rj3THJrabHC-j=qxHbCaCDZExoh4rH-Rg@mail.gmail.com>
From: Yuan Can <yuancan@huawei.com>
In-Reply-To: <CACeCKaevCdGYkC0+3rj3THJrabHC-j=qxHbCaCDZExoh4rH-Rg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.41]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected


在 2022/11/19 4:11, Prashant Malani 写道:
> On Fri, Nov 18, 2022 at 2:18 AM Yuan Can <yuancan@huawei.com> wrote:
>>
>> 在 2022/11/18 3:07, Prashant Malani 写道:
>>> Hi Yuan,
>>>
>>> On Thu, Nov 17, 2022 at 12:10 AM Yuan Can <yuancan@huawei.com> wrote:
>>>> The reason is that the cros_usbpd_notify_init() does not check the return
>>>> value of platform_driver_register(), and the cros_usbpd_notify can
>>>> install successfully even if platform_driver_register() failed.
>>>>
>>>> Fix by checking the return value of platform_driver_register() and
>>> Can you provide details regarding why cros_usbpd_notify_acpi_driver registration
>>> is failing on your system (logs or other details) ?
>> The reason could be an OOM happend when platform_driver_register() tries
>> to allocate memory,
>>
>> a simple call graph:
>>
>>    platform_driver_register()
>>      driver_register()
>>        bus_add_driver()
>>          dev = kzalloc(...) # OOM happened
>>
> Sure, but is that what you're seeing? Can you share logs from your repro case?
Yes, that the reason, this problem is triggered by the OOM 
fault-injection test.

-- 
Best regards,
Yuan Can


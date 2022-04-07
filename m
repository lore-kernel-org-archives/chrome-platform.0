Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4862570
	for <chrome-platform@lists.linux.dev>; Thu,  7 Apr 2022 17:03:57 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id s137so2733127pgs.5
        for <chrome-platform@lists.linux.dev>; Thu, 07 Apr 2022 10:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=o7DSjU/xqsy5AN43adD8t3WIGQh58clKwf1/MSjnezU=;
        b=NNzy7KBEDqTeDpfORIJWKVxVgYlxgXab9P2GUoqXJaO+iclNG3I0IQewNcIaXqn3sb
         X8JT7yXdiwed/rH+gUtGXXIGyVz3PWGY2FsiltlfKQMGQJ+achwjKMEdX7/jfKK+szwt
         n4Y63fpbVOOFn36A2QKJcS8NW1yFKENg2hDiz0fVfbP9FRWp7DoyTZZLu9YSQ/jpEUaK
         gQeOyisl1FZ9sj0ahUQ8KhpJi58JbsCVvbtgg+BL/V7Z5xlMmF85eDwRafnMaLifLGQc
         n7S88/96zfIYHXrTwD/BgskKB3VEeRw+NU30fpav1XUXDt+52+/C9pEpBwqunqfRu9ZN
         Hing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=o7DSjU/xqsy5AN43adD8t3WIGQh58clKwf1/MSjnezU=;
        b=kUAIwZ8m+VeImaMnwHpC5N/hn05UIa6YLiA/UtElNBPWuvVQxz0ysScJy9wW+p3zod
         SQfy3zN3mbeAm6EqOx+5jjE1ts3UNlIiKTan09c6tNjNQfNiOHIgoo8E/vAN/clva1/7
         kwHVXT71azLscZ3aooqkRS5KAtRDCQ5SOLVvtIUt9yyy2XocMCmb/wpaS5cz/H9/4TNC
         IfxUwPQDz1vAaBOKTroZ7dQw2lEKUPOYv4CcWF+VaLV+db4lbTjUKzwPAAkeFgS5tLC0
         zSHaMwkUiiKqQrLT6zYxnO9d21snnoea2aK9wSYI8gG03Ai7O8tWF1WhnUaHYQ2jXg0l
         hjRw==
X-Gm-Message-State: AOAM530HhTsu3VkjNH/asLbNs/C+9LeQdnjv/90QVZQDHJS2QVIuHdQF
	GDCAReRzEB/W+JvpNTgm5LU=
X-Google-Smtp-Source: ABdhPJwQI7ynXVTWqobtJxGlzNkdbGN3HOUSpbgNgINefYsCfjF4/7+CqvaD34sE2OMn1FWyboVJyw==
X-Received: by 2002:a05:6a00:a8b:b0:4e1:52db:9e5c with SMTP id b11-20020a056a000a8b00b004e152db9e5cmr15182922pfl.38.1649351036931;
        Thu, 07 Apr 2022 10:03:56 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
        by smtp.gmail.com with ESMTPSA id g3-20020a17090a708300b001c7e8ae7637sm9360090pjk.8.2022.04.07.10.03.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 10:03:56 -0700 (PDT)
Message-ID: <0fdba110-8743-3b2d-cb30-3a89b7cfa592@gmail.com>
Date: Fri, 8 Apr 2022 02:03:52 +0900
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Check for EC driver
Content-Language: en-US
To: Guenter Roeck <groeck@google.com>
Cc: Prashant Malani <pmalani@chromium.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 chrome-platform@lists.linux.dev, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
References: <20220404041101.6276-1-akihiko.odaki@gmail.com>
 <Yk4DGZfpYbK8dofL@chromium.org>
 <CABXOdTcY3w56hc7kWsDLxKU-c6fCLYt_jigK13tKjjm9OHi2+w@mail.gmail.com>
 <033c1ec4-4bee-a689-140c-9694dfee435b@gmail.com>
 <CABXOdTet5ynSXf94qMimobJF4LLzHc89cVbwJ5NuAz8G6jmVdQ@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CABXOdTet5ynSXf94qMimobJF4LLzHc89cVbwJ5NuAz8G6jmVdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/04/08 1:28, Guenter Roeck wrote:
> On Wed, Apr 6, 2022 at 6:16 PM Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> [ ... ]
>>>>>         ec_dev = dev_get_drvdata(&typec->ec->ec->dev);
> 
> I completely missed the part that this is not on the parent.
> 
>>>>> +     if (!ec_dev)
>>>>> +             return -EPROBE_DEFER;
> [ ... ]
>>
>> 1. The parent exists and dev_get_drvdata(pdev->dev.parent) returns
>> non-NULL value. However, dev_get_drvdata(&typec->ec->ec->dev) returns
>> NULL. (Yes, that is confusing.) I'm wondering
> 
> I am actually surprised that typec->ec->ec is not NULL. Underlying
> problem (or, one underlying problem) is that it is set in
> cros_ec_register():
> 
>          /* Register a platform device for the main EC instance */
>          ec_dev->ec = platform_device_register_data(ec_dev->dev, "cros-ec-dev",
>                                          PLATFORM_DEVID_AUTO, &ec_p,
>                                          sizeof(struct cros_ec_platform));
> 
> "cros-ec-dev" is the mfd device which instantiates the character
> device. On devicetree (arm64) systems, the typec device is registered
> as child of google,cros-ec-spi and thus should be instantiated only
> after the spi device has been instantiated. The same should happen on
> ACPI systems, but I don't know if that is really correct.
> 
> I don't know what exactly is happening, but apparently typec
> registration happens in parallel with cros-ec-dev registration, which
> is delayed because the character device is not loaded. As mentioned, I
> don't understand why typec->ec->ec is not NULL. Can you check what it
> points to ?

If I read the code correctly, the registration itself happens 
synchronously and platform_device_register_data() always returns a 
non-NULL value unless it returns -ENOMEM. The driver, however, can be 
asynchronously bound and dev_get_drvdata(&typec->ec->ec->dev) can return 
NULL as the consequence. It would have a call trace like the following 
when scheduling asynchronous driver binding:
platform_device_register_data()
platform_device_register_resndata()
platform_device_register_full()
-  This always creates and returns platform_device.
platform_device_add()
- This adds the created platform_device.
device_add()
bus_probe_device()
device_initial_probe()
__device_attach()
- This schedules asynchronous probing.

typec->ec->ec should be pointing to the correct platform_device as the 
patched driver works without Oops on my computer. It is not NULL at least.

Regards,
Akihiko Odaki

> 
> Thanks,
> Guenter
> 
>> dev_get_drvdata(pdev->dev.parent) returned NULL in the following crash
>> log but it would be a problem distinct from what is handled with my patch:
>> https://lore.kernel.org/lkml/CABXOdTe9u_DW=NZM1-J120Gu1gibDy8SsgHP3bJwwLsE_iuLAQ@mail.gmail.com/
>>
>> 2. My patch returns -EPROBE_DEFER instead of -ENODEV and I confirmed it
>> will eventually be instantiated.
>>
>> Regards,
>> Akihiko Odaki
>>
>>>
>>> Guenter
>>>
>>>> Thanks,
>>>>
>>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/platform/chrome?id=ffebd90532728086007038986900426544e3df4e
>>


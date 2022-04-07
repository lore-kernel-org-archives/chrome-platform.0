Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D91C20E0
	for <chrome-platform@lists.linux.dev>; Thu,  7 Apr 2022 01:16:40 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id h19so4102912pfv.1
        for <chrome-platform@lists.linux.dev>; Wed, 06 Apr 2022 18:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=XEH2/iJSIuFDfccdM1u0P17EAr+Um5R1hy9qLgtDR4M=;
        b=OA772vpHfAHBIugPh/XQtfpHmDsxqkQi1/UBaoCG494fupS3OiR5177KLxWxK+Anul
         kVBwCein30GC1DSn9oNgOdwt/4xuUnFmA83pb9Oy1XlrpC7mrRwculkEPmkgorr7Nvw3
         FxUpTqtK+QFzZ7EwGcFWcBL+vJ9AZiCQyYyPRqYOXlqVLzp2Xz0w8OJWK2Tnd84fpF4b
         eVYFEZGYjNCZ/TWfirUGtKstsDJ1e8mtg1Y1LInzT9rNq5LxsXEsLlTBXEIykz6I1BMS
         hH8z9FSKXAEWAIwM5IamgQQ3kd3OZhSm6JhdSg6ppXJDixVNwrOInkzAexuVe6NuE0QY
         P4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=XEH2/iJSIuFDfccdM1u0P17EAr+Um5R1hy9qLgtDR4M=;
        b=fWrgF46OtYo6KZ/zdtT3eXLk5BaFWX4/4LxYg7vWId35kCmE6VQX0M0h/O0gN+uMdL
         yTjOCWttkR0MWKNVbCCEIP1lua9tZeotNui7A7LymZZqDiXZmTdVRrZQSlPix6BNn3ZS
         SXtu3oWQIpD4Z+xrY3Hq+5BDiz8GupOtdsfoRIgsJQY6jMKxU+f8LLLk1AX77oWR5gq1
         QUXRLWcCDg/gc0PLYa0DSsTGbMuXgm3XLR5j+e9wBwo3CuuKZnv4MQk/nyF9cuqzgnv3
         ofC8xMCHoi+35ysQ/MRioOfRRxzBCwx0L+IvBQsQ6lkxFxNLMf66wjV7x9Ui8hkE3BgI
         rojA==
X-Gm-Message-State: AOAM533qQwjP5kVYCF2TKxNWkiaWt6tYPWwYRZsFduUapW0vhaoSEtes
	nljVqzGn1fMR5VWrbqDaGw8=
X-Google-Smtp-Source: ABdhPJxeut6cNaSvd6pF6Lvv5nTN8xCifWxFyWzc6LiaKMmh7lwfZfm9eAReqpDY1PNuJQjaIqoOHw==
X-Received: by 2002:a05:6a00:1488:b0:4fa:ac61:8b11 with SMTP id v8-20020a056a00148800b004faac618b11mr12031950pfu.58.1649294199390;
        Wed, 06 Apr 2022 18:16:39 -0700 (PDT)
Received: from [192.168.66.3] (p912131-ipoe.ipoe.ocn.ne.jp. [153.243.13.130])
        by smtp.gmail.com with ESMTPSA id i187-20020a62c1c4000000b004faafada2ffsm21107363pfg.204.2022.04.06.18.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Apr 2022 18:16:38 -0700 (PDT)
Message-ID: <033c1ec4-4bee-a689-140c-9694dfee435b@gmail.com>
Date: Thu, 7 Apr 2022 10:16:34 +0900
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
To: Guenter Roeck <groeck@google.com>, Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 chrome-platform@lists.linux.dev, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>
References: <20220404041101.6276-1-akihiko.odaki@gmail.com>
 <Yk4DGZfpYbK8dofL@chromium.org>
 <CABXOdTcY3w56hc7kWsDLxKU-c6fCLYt_jigK13tKjjm9OHi2+w@mail.gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <CABXOdTcY3w56hc7kWsDLxKU-c6fCLYt_jigK13tKjjm9OHi2+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2022/04/07 6:32, Guenter Roeck wrote:
> On Wed, Apr 6, 2022 at 2:16 PM Prashant Malani <pmalani@chromium.org> wrote:
>>
>> Hi Akihiko,
>>
>> Thanks for the patch.
>>
>> On Apr 04 13:11, Akihiko Odaki wrote:
>>> The EC driver may not be initialized when cros_typec_probe is called,
>>> particulary when CONFIG_CROS_EC_CHARDEV=m.
>>>
>>> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
>>> ---
>>>   drivers/platform/chrome/cros_ec_typec.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
>>> index 4bd2752c0823..7cb2e35c4ded 100644
>>> --- a/drivers/platform/chrome/cros_ec_typec.c
>>> +++ b/drivers/platform/chrome/cros_ec_typec.c
>>> @@ -1084,6 +1084,9 @@ static int cros_typec_probe(struct platform_device *pdev)
>>>        }
>>>
>>>        ec_dev = dev_get_drvdata(&typec->ec->ec->dev);
>>> +     if (!ec_dev)
>>> +             return -EPROBE_DEFER;
>>> +
>>
>> Just a quick check: are you still seeing this issue with 5.18-rc1, which
>> contains a null check for the parent EC device [1] ?

Yes, I'm seeing this problem with the check.

>>
> 
> I may be missing something, but from the context I suspect this may
> make the problem worse. My understanding was that the problem was seen
> specifically if CONFIG_CROS_EC_CHARDEV=m. In that situation, it
> appears that the parent EC device does _not yet_ exist. If the driver
> returns -ENODEV in that situation, it will never be instantiated. The
> big question for me is why the type C device is instantiated in the
> first place if the parent EC device does not [yet] exist. I have not
> been able to identify the code path where this happens. >
> There is a similar problem with other EC child devices which are also
> sometimes instantiated even though the parent EC device does not exist
> (ie dev_get_drvdata(pdev->dev.parent) returns NULL). That can happen
> if the parent EC device instantiation fails because of EC
> communication errors (see https://b.corp.google.com/issues/228118385
> for examples [sorry, internal only, I can't make it public]). I think
> we need to track down why that happens and prevent child devices from
> being instantiated in the first place instead of trying to work around
> the problem in the child drivers.

Well, I think you have two misunderstanding.

1. The parent exists and dev_get_drvdata(pdev->dev.parent) returns 
non-NULL value. However, dev_get_drvdata(&typec->ec->ec->dev) returns 
NULL. (Yes, that is confusing.) I'm wondering 
dev_get_drvdata(pdev->dev.parent) returned NULL in the following crash 
log but it would be a problem distinct from what is handled with my patch:
https://lore.kernel.org/lkml/CABXOdTe9u_DW=NZM1-J120Gu1gibDy8SsgHP3bJwwLsE_iuLAQ@mail.gmail.com/

2. My patch returns -EPROBE_DEFER instead of -ENODEV and I confirmed it 
will eventually be instantiated.

Regards,
Akihiko Odaki

> 
> Guenter
> 
>> Thanks,
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/platform/chrome?id=ffebd90532728086007038986900426544e3df4e


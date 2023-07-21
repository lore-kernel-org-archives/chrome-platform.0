Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A6727F00
	for <chrome-platform@lists.linux.dev>; Fri, 21 Jul 2023 17:16:14 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-992f15c36fcso341712066b.3
        for <chrome-platform@lists.linux.dev>; Fri, 21 Jul 2023 10:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689959772; x=1690564572;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1TheVL5v7h1oU6uewYQYbXyMT32QmeTiVrAkQKUeq3w=;
        b=AXG7XTT8Zv7VRe/X+kgai4M7oUendmdC6/9N24UNlMJQ3IQWp5DZBvdOVbfKfnrpJv
         dU+R9tFAIOhAkbNID+M238BE6zXP4HQezRztKQ5VVe8s++qFvuB9BMAe7Sh8tDqLx2f2
         QocdkOVbekf43MCwyvZDt+pGZnaxfut8yacllEH1fW1ikiuq6im/gXIyN9oziK5s1PqV
         8D7fo4VuBwD4bD5yuS6sS29r81Eu/DiGEUlKUtZmXeIbWT0u3HQ7p4e7FnutJgpttw2I
         G0wTfzCKCxRxNS3rkHR2RADZ1PeKh1RQWPnuwMAl/en2NS2PYVuGqJ+TBFX5+vJBRX87
         Vn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689959772; x=1690564572;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1TheVL5v7h1oU6uewYQYbXyMT32QmeTiVrAkQKUeq3w=;
        b=Rfy61154jt0pvj122pRcFA/k9v+RIvb7OC+j5XOhJdKdOASFJFjGhXul6Az3xWvLkV
         PM3b+wvUIYCdpKkO7/hMB+EuXYxYM5m1f61FtT5IFg/QFVPrQh3uBPzLDpzz1uxCWvmx
         heuChNzu4iBnljgVqBf38Fl3YSicZ6Jlk331ih+fhZOLhha04SwZRvOPiy5XiVhUZ102
         UH3fIvVx6NkVlz6TT3PsnqB1S/4+KUKLKIyCtKDfrONvtxlaGSj447Lbvnk6BqFVlwn0
         GTOnMbeIVI9Zzln30VKdFDl+e21Jj1k85aIDsy7suA4WOmErGz7Aw3N0figyP2LWcjST
         E3gg==
X-Gm-Message-State: ABy/qLbYYzWJH38N0PjD/iwsb4EICrQ7yWswQJb//9I2U9gByqrm51u1
	0bO3f4d2brq+2/TVYfbZxZ4=
X-Google-Smtp-Source: APBJJlHSsKhgQOQoCDZFvkCCfRrfz/wk6KngN2wtE9SP0wN+0LFNRFofTpxAau4jKXFnPiN5cKqtZQ==
X-Received: by 2002:a17:906:10db:b0:993:e860:f20 with SMTP id v27-20020a17090610db00b00993e8600f20mr2495418ejv.19.1689959772157;
        Fri, 21 Jul 2023 10:16:12 -0700 (PDT)
Received: from [10.4.145.3] (83.10.92.232.ipv4.supernova.orange.pl. [83.10.92.232])
        by smtp.gmail.com with ESMTPSA id si1-20020a170906cec100b00992d70f8078sm2456202ejb.106.2023.07.21.10.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 10:16:11 -0700 (PDT)
Message-ID: <b1370c4b-7bad-4aac-0fa7-32d6479aa255@gmail.com>
Date: Fri, 21 Jul 2023 19:13:58 +0200
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] platform/chrome: cros_ec_lpc: Add DMI definition for
 post-Skylake machines running custom Coreboot builds
Content-Language: en-GB
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org, robbarnes@google.com,
 lalithkraj@google.com, rrangel@chromium.org, bleung@chromium.org,
 groeck@chromium.org, chrome-platform@lists.linux.dev
References: <ZLm3G5G6/gmLZwkn@tora> <ZLooCXV11JCdWOdK@google.com>
From: Alicja Michalska <ahplka19@gmail.com>
In-Reply-To: <ZLooCXV11JCdWOdK@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Thank you for your feedback.

I've explained the reason behind adding this patch, but we'll go with 
different approach next time around.

Since we're discussing this, I would like to suggest removal of DMI 
matches for EOL machines from lines 503...535 (Link, Samus, Peppy, Glimmer).

Those machines aren't supported by Google anymore. Patch I suggested 
will match DMI while running custom firmware.

If maintainers are okay with it, I will submit a patch removing DMI 
matches for stock firmware running on those machines since it's not 
needed anymore.

On 21/07/2023 08:39, Tzung-Bi Shih wrote:
> On Fri, Jul 21, 2023 at 12:37:15AM +0200, Alicja Michalska wrote:
>> ChromeOS EC LPC lacks DMI match for newer machines, which
>> use "Google" DMI_SYS_VENDOR as opposed to "GOOGLE" in older models.
> 
> I'm confused about the sentence as it looks irrelevant to the patch.
> 
>> This patch adds DMI definition for MrChomebox's custom Coreboots builds,
>> which we (Chrultrabook Project) are using.
> 
> s/This patch adds/Add/.  Search "imperative mood" in [1].
> 
> Looks like a typo: s/MrChomebox/MrChromebox/.
> 
> If you get chance to send next version, please shorten the commit title.
> I guess "platform/chrome: cros_ec_lpc: Add DMI match for MrChromebox" should
> be quite explicit.
> 
> [1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> 
>> +	/* DMI doesn't match modern machines running custom firmware */
> 
> Remove the line.
> 
>> +	{
>> +		/* MrChromebox's firmware */
>> +		.matches = {
>> +			DMI_MATCH(DMI_BIOS_VENDOR, "coreboot"),
>> +			DMI_MATCH(DMI_BIOS_VERSION, "MrChromebox-"),
>> +		},
>> +	},
> 
> Put the block after "A small number of non-Chromebook/box machines also use
> the ChromeOS EC"[2].
> 
> [2]: https://elixir.bootlin.com/linux/v6.4/source/drivers/platform/chrome/cros_ec_lpc.c#L533

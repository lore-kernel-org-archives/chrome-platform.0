Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BEE258F
	for <chrome-platform@lists.linux.dev>; Thu,  7 Apr 2022 18:52:11 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id ot30so12666435ejb.12
        for <chrome-platform@lists.linux.dev>; Thu, 07 Apr 2022 11:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=g/s/dz2/6Hbj/5UtThLNXvWjhjgt6+Hm9DR6vV4CONg=;
        b=rO+QJDYo4qa4mxnut16LDPVa7HWgESnE+x4Rqbq2g2UOsuWrmh31lhxhnpzvoYWWQl
         FrSRWhasf8ZEQY3BNvb7+gh9l99lHrP0TjtzN9a6OE/xjRjG3aclJucJoqYsxSN/3CZu
         AyadrhhfR80zu9y8aAK+sQIQKKd9JIXiTi6UKOjOTYEGyOoG8266IgDy1Zt3n3QbN9L0
         pXR1w3Rq5Gu37DTo/VV5IoFiByzk5f9aWGlV86CNogTN14OJukPMiz+c95aKdP+bm1jk
         QNcvnou1kZZKWBnagB6iFK/D/WJNavHNOdBJIgcLfgUi+6FjrI0Aymlezlc5NfkMNYQZ
         +YZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=g/s/dz2/6Hbj/5UtThLNXvWjhjgt6+Hm9DR6vV4CONg=;
        b=apP6gNeoM3jlYR6F9ktWWwKmRXmXW+bZslt+6+iCA2Qk73znUPtR0xghLSAFnxOqt+
         v+Urp+LrMqJqQ1ogdO9HMq0/6IrNGA8TbJuyf6Zb2T5W/+HNzZtKA8JheVyqYg4waWGW
         93hZWAyAp+5w+/N3jeHrRco30y6TZuoVWSeQiucwao6BPigCdwqhp59zgJxrzRRggmz2
         3gmpd7ey2r2bqip+0sBp8NyMJEbyLplUW+5Xsx5NE/QzUKvavnL/fTGemtL8HtkFgxG9
         QiXeA3fAxAXSrBj+rWrbvOzNMmgzbClXyOSm/xJXeX5VH8ASXchVca2955N1lgQMRT3S
         O2Bg==
X-Gm-Message-State: AOAM531CzufH0pTeNSUnncpdJKkMj6pTGXPmksg4xfJONhD+c2gs3PoA
	vH+WZS2SK8FZSfsyqaToiUmcZz6bujkmHWZC+8SVjQ==
X-Google-Smtp-Source: ABdhPJzgbJVlisvjBS51N0wr4zk/Q8qQ6PPM7JBdbT91ANkpCzM4cQaeLhz3HQmcJQPf/oGBXpcz3UAJWrZc4DTBU6A=
X-Received: by 2002:a17:906:300f:b0:6e0:b38d:777d with SMTP id
 15-20020a170906300f00b006e0b38d777dmr14920373ejz.189.1649357529432; Thu, 07
 Apr 2022 11:52:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220404041101.6276-1-akihiko.odaki@gmail.com>
 <Yk4DGZfpYbK8dofL@chromium.org> <CABXOdTcY3w56hc7kWsDLxKU-c6fCLYt_jigK13tKjjm9OHi2+w@mail.gmail.com>
 <033c1ec4-4bee-a689-140c-9694dfee435b@gmail.com> <CABXOdTet5ynSXf94qMimobJF4LLzHc89cVbwJ5NuAz8G6jmVdQ@mail.gmail.com>
 <0fdba110-8743-3b2d-cb30-3a89b7cfa592@gmail.com> <Yk8atphiUdlU0gPO@google.com>
In-Reply-To: <Yk8atphiUdlU0gPO@google.com>
From: Guenter Roeck <groeck@google.com>
Date: Thu, 7 Apr 2022 11:51:58 -0700
Message-ID: <CABXOdTeAN201fA5FMT1jhOmooNHmvkZPdjnwMM=5j-btovF+3Q@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Check for EC driver
To: Benson Leung <bleung@google.com>
Cc: Akihiko Odaki <akihiko.odaki@gmail.com>, Prashant Malani <pmalani@chromium.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, chrome-platform@lists.linux.dev, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 7, 2022 at 10:09 AM Benson Leung <bleung@google.com> wrote:
>
> Hi Akihiko,
>
> On Fri, Apr 08, 2022 at 02:03:52AM +0900, Akihiko Odaki wrote:
> > If I read the code correctly, the registration itself happens synchronously
> > and platform_device_register_data() always returns a non-NULL value unless
> > it returns -ENOMEM. The driver, however, can be asynchronously bound and
> > dev_get_drvdata(&typec->ec->ec->dev) can return NULL as the consequence. It
> > would have a call trace like the following when scheduling asynchronous
> > driver binding:
> > platform_device_register_data()
> > platform_device_register_resndata()
> > platform_device_register_full()
> > -  This always creates and returns platform_device.
> > platform_device_add()
> > - This adds the created platform_device.
> > device_add()
> > bus_probe_device()
> > device_initial_probe()
> > __device_attach()
> > - This schedules asynchronous probing.
> >
> > typec->ec->ec should be pointing to the correct platform_device as the
> > patched driver works without Oops on my computer. It is not NULL at least.
>
> Can you provide more information about your test computer in this case?
>
> Is it a Chromebook running stock firmware (if so, please let us know which
> model, and which firmware version it is running).
> In the past, we've also gotten some reports from people running MrChromebox
> custom firmware on older Chromebooks which have exposed other bugs in
> this driver.
>

I think we should be able to reproduce the problem by configuring
CONFIG_CROS_EC_CHARDEV=m on any Chromebook supporting Type C.

Guenter

> Let us know if that's the case here, and where we can get that firmware.
>
> Thanks,
> Benson
>
> --
> Benson Leung
> Staff Software Engineer
> Chrome OS Kernel
> Google Inc.
> bleung@google.com
> Chromium OS Project
> bleung@chromium.org

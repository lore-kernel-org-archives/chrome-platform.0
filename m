Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4D02F25
	for <chrome-platform@lists.linux.dev>; Wed, 11 May 2022 17:41:09 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id y21so3462805edo.2
        for <chrome-platform@lists.linux.dev>; Wed, 11 May 2022 10:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2Ke+AGfzv6tvoEFSxFKuURhI7WvGdekzVHjZqAbbO8s=;
        b=G9wqQwuFFHa1lknmirIg8grgSmlGhY4vOMeTI7ajMbQFOkPDfAjxkC53pYWGPJ2cZF
         JYFgcz/9NdUz5O/wqsbhfPi2zN/aY/XE8j2tiIE+GNsGbyuPFnW8P1tp2iJW3pJ7hdxQ
         0IWMmg6WoVXdfvmSzYuR0vhQNDCC0PHJKULu799/jK8hUupfLZ4wSeZ7OW6yle+knuIx
         wKXck2gICgiHyMkOEoopjNhzgzuCsUiXl0Fc8RjVEZqu59KvypFwP3AWHlhIyW+2eUvJ
         9/csBr94Q6HkyJhoRRrkcPuuXe8cn9wJZuWneLmHD2vUIG70ZoAZdfhxmnMfAxo/8/s1
         RtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2Ke+AGfzv6tvoEFSxFKuURhI7WvGdekzVHjZqAbbO8s=;
        b=ogktzJ+s9VdrKi36S/Tc0x/2iaWA+ziyoTA5vjz3UKsyESl2O9vL7iyd8mQ60roErn
         +/dM6KrIT4XCk1GseiX+xn+6VgbKIEKR5Ry6ufuPsEL81KBlOYqvDFT7hsmOptcpR5sh
         tbMsiYVtdliOsoiIvENaznT6X7nxWAnFKHBQhHWirXTaL81cUGXqUpLv6TwVzbwtCKk3
         tK231ZjMil1YBR307wc1E6mF5yxi83wS7i7QcEPdTDTVpVcAe8thnPOhGxsBAJMprAlb
         6nQI9sSJwGKue20vaPYe9/fhGoHt4deEu8Gx2hdc8wNi7J5PU+OS3d3qqNpLcnP4ISOd
         j7pw==
X-Gm-Message-State: AOAM532KEkSgaEW1v2Bb735QcZQEWzYp0bKNbnNcnmOTP2R0m9tVJ9D3
	/OXq2EAJCBAlSEBqg6Euo/nPUjZ+cUtEXuVwV9o=
X-Google-Smtp-Source: ABdhPJypHOUVtZ/mWQM6O1I1uprLxF37dkIpuFfu2UGbONcylK6L0+EILGXJ8zFdWrxtLQMY1Q94ZDxv7qrd1l5g0T4=
X-Received: by 2002:a05:6402:1d4c:b0:427:d1f5:3a41 with SMTP id
 dz12-20020a0564021d4c00b00427d1f53a41mr29873435edb.218.1652290868261; Wed, 11
 May 2022 10:41:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YnoJ0k6eIUiwjXSZ@debian-BULLSEYE-live-builder-AMD64>
 <CAHp75Vd574LCnEq-KX=WHnnDyrjZgGu6W9wNEbnw79FBpyx=Lw@mail.gmail.com> <8bd83f45-5278-e817-3f65-88fafd0ad3f4@collabora.com>
In-Reply-To: <8bd83f45-5278-e817-3f65-88fafd0ad3f4@collabora.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 11 May 2022 19:40:31 +0200
Message-ID: <CAHp75VcQYncfCv-2GE0a0e=0iOLBC6wMvoH8pFCirN3NyLzdhw@mail.gmail.com>
Subject: Re: [PATCH RESEND v11] platform/chrome: Add ChromeOS ACPI device driver
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
	Benson Leung <bleung@chromium.org>, Enric Balletbo i Serra <eballetbo@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Collabora Kernel ML <kernel@collabora.com>, 
	Guenter Roeck <groeck@chromium.org>, Dmitry Torokhov <dtor@chromium.org>, 
	Gwendal Grignou <gwendal@chromium.org>, vbendeb@chromium.org, 
	Andy Shevchenko <andy@infradead.org>, Ayman Bagabas <ayman.bagabas@gmail.com>, 
	Benjamin Tissoires <benjamin.tissoires@redhat.com>, =?UTF-8?Q?Bla=C5=BE_Hrastnik?= <blaz@mxxn.io>, 
	Darren Hart <dvhart@infradead.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jeremy Soller <jeremy@system76.com>, Mattias Jacobsson <2pi@mok.nu>, 
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Rajat Jain <rajatja@google.com>, 
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>, 
	Platform Driver <platform-driver-x86@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	ACPI Devel Maling List <linux-acpi@vger.kernel.org>, 
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, May 11, 2022 at 5:59 PM Muhammad Usama Anjum
<usama.anjum@collabora.com> wrote:
> On 5/10/22 2:33 PM, Andy Shevchenko wrote:
> > On Tue, May 10, 2022 at 8:44 AM Muhammad Usama Anjum
> > <usama.anjum@collabora.com> wrote:

...

> >> +       static struct attribute *attrs_##_group[] = {                                   \
> >> +               &dev_attr_0_##_group.attr,                                              \
> >> +               &dev_attr_1_##_group.attr,                                              \
> >> +               &dev_attr_2_##_group.attr,                                              \
> >> +               &dev_attr_3_##_group.attr,                                              \
> >> +               NULL                                                                    \

(1)

> >> +       };                                                                              \
> >> +       static const struct attribute_group attr_group_##_group = {                     \
> >> +               .name = _name,                                                          \
> >> +               .is_visible = attr_is_visible_gpio_##_num,                              \
> >
> >> +               .attrs = attrs_##_group                                                 \
> >
> > Keep a comma here.

> Is there any particular reason for it?

Yes, if it's not a terminator entry, like (1), the comma would help to
avoid unneeded churm in the future in case someone wants to add
another initialization member.

> If there is, I'll add commas to
> all the structures.

It depends if it is a terminator entry or not, so please check
carefully where to add and where not (the latter example is (1) where
comma is not needed and theoretically might add a confusion).

-- 
With Best Regards,
Andy Shevchenko

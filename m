Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E881255F31
	for <chrome-platform@lists.linux.dev>; Wed, 10 Sep 2025 19:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757532890; cv=none; b=pSnO3cBnvTXqkuaG7MOaCyh3n+vDSEjweaFfNPF7Q/+xacE7+NYxO/3t5ij1unsCZtV66//xLkUHkLQpsSD1lisGdQomGmNGM/kASx0/MhuKYghcPZvbeqznRwbLDwDrgwme00HZhzmlGilw/9I4ZF3jn4o4Z1j0jAAip3gN0hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757532890; c=relaxed/simple;
	bh=TlFZ876ym1zPhLDfhX7aHxJ50xGVPk5BB2YMzIfIBGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mUzJR0sMJYVywROXw2Yde9wYKu+wXAP7PBA3ls60qVIfUZHBkW1snnwnoXF3IrbwWptdRIpo8dFEiegC3puC6y3OtGYDhOzOy6mfQ8xvkDmphBqA0RyrLX/9G0ybyjVwE5UdOoHzazEPQ2sPo1PKqhQ+W69qv/jXJ1fjXnaT1xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WxHFe5YG; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WxHFe5YG"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-24af8cd99ddso92799655ad.0
        for <chrome-platform@lists.linux.dev>; Wed, 10 Sep 2025 12:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757532888; x=1758137688; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7nv+RpfQptx2Dl6xXJ4qT+jcDztk0WNklxglJQoI+8=;
        b=WxHFe5YGD0iNOt+gP/kpNiot9TzrvLxfzNMUFpIfF1xdDwxkS5gm3jVNQuA4TLpwcL
         /yFH5KDk+ZaGbIJH65z8bB9lPVG8RygWMAKFtpvV21CZ08Xxd8TwsB26vIhBQIFQ04O4
         LQNcGf8rRt8yGzCK0NNvsXlj0+5KsY/tyYnio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757532888; x=1758137688;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7nv+RpfQptx2Dl6xXJ4qT+jcDztk0WNklxglJQoI+8=;
        b=q+pgKjfQFDh8ikCBjPharDMoVXUocmDgbI5CyNGe1WsSQXqH5acn5Cu2JVVaTYoief
         De2bQ4jJwQo0PhVSbroWp9ly/ytqJlnHJAhJcX0UERMuZQDdqGdp1efCfXjqpzGYysX1
         nMc5rtTwwsDPKC8/eGEjn/k8r5R/Cl3JiqK1SD7T2AwyjooYyODROXFD3aBmN0LTAuRr
         4r4czFTLQq3kQJmUsvYSkqPT2qHF19R0egBokaKpIubt8XrJ+mmIc/KlyXSX0A3+pRZJ
         dmU/XfVmgqmK+NEiV7WKf9SmDdlfj6YoH629+JfumWZzmrlRM8PlcdsHlKBpt9uBr877
         XPzw==
X-Forwarded-Encrypted: i=1; AJvYcCWdCPLQrjVLlZaIw1TsP2/Q4x0bOb4ky5b/HlTSwmFeGXgUyzc8/QlSMTcVCmATJJmk9hWtYDdFRJ3QOv2lZlA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxgonet9S/oIByJ7sUbuXVvFfhAZocHFA6Zjoji9QQgkMX+7fAt
	0M8AJ3Bex4LVnGddvtQSGY54QiTlQ1ylyWaivvVrI5okVFM5WnzRl9mC55COPSqBDGJsVclA3/J
	k5PXLYZm7aIqJEj7OgPDdTkF3NctD96vl6B1aKVvt
X-Gm-Gg: ASbGncvjQ8iFGgPxtLB8Plo8KqJ4JlIGGKrosZiNNZJT/Q2+l15ryVOZpuE2ntEg13Y
	L63AlORNS6IPNp8CKj36MA50FU3tPhOSExj7iw/FpHHs0XGnCKgA6//e27r7pecgQOyyWl9Nlcg
	Nfq5qBql6FSkmJtxgDjV850RmLDV7kw+kLuSe24hveMI8eEyWtgnpj+SjGC29IroDlGGGk/D0+c
	PLVg+2Z9iY8GmjrC5va+HQQSiZH4VGffwg=
X-Google-Smtp-Source: AGHT+IE/at+K4KcGofhNw+REQdpZKQ8VO1T6F/D0h+7ljw7nkukWyHLVVN9Bi1RQy5b2/QZoegCU8M/V8D5zD+/sXjk=
X-Received: by 2002:a17:903:4b4e:b0:24a:a724:717f with SMTP id
 d9443c01a7336-25173301d16mr220825655ad.47.1757532888514; Wed, 10 Sep 2025
 12:34:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250905142206.4105351-1-akuchynski@chromium.org>
 <20250905142206.4105351-6-akuchynski@chromium.org> <2025091028-darkish-washcloth-3d02@gregkh>
In-Reply-To: <2025091028-darkish-washcloth-3d02@gregkh>
From: Andrei Kuchynski <akuchynski@chromium.org>
Date: Wed, 10 Sep 2025 19:34:35 +0000
X-Gm-Features: Ac12FXxPC50d353IUIsG2_cG43UVWgmx2EKjnyX-DHWSloYkCCDiVnxHD9i8OX4
Message-ID: <CAMMMRMcqVMeyHnGHPsr6XH+npY2foCXae6psOhCLz1C6+bGPYA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] usb: typec: Expose alternate mode priority via sysfs
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Guenter Roeck <groeck@chromium.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, "Christian A. Ehrhardt" <lk@c--e.de>, 
	Venkat Jayaraman <venkat.jayaraman@intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 10, 2025 at 1:28=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Sep 05, 2025 at 02:22:06PM +0000, Andrei Kuchynski wrote:
> > This patch introduces a priority sysfs attribute to the USB Type-C
> > alternate mode port interface. This new attribute allows user-space to
> > configure the numeric priority of alternate modes managing their prefer=
red
> > order of operation.
> >
> > Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> > Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > ---
> >  Documentation/ABI/testing/sysfs-class-typec | 11 +++++++
> >  drivers/usb/typec/class.c                   | 32 ++++++++++++++++++++-
> >  2 files changed, 42 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentatio=
n/ABI/testing/sysfs-class-typec
> > index 38e101c17a00..dab3e4e727b6 100644
> > --- a/Documentation/ABI/testing/sysfs-class-typec
> > +++ b/Documentation/ABI/testing/sysfs-class-typec
> > @@ -162,6 +162,17 @@ Description:     Lists the supported USB Modes. Th=
e default USB mode that is used
> >               - usb3 (USB 3.2)
> >               - usb4 (USB4)
> >
> > +             What:           /sys/class/typec/<port>/<alt-mode>/priori=
ty
> > +Date:                July 2025
> > +Contact:     Andrei Kuchynski <akuchynski@chromium.org>
> > +Description:
> > +             Displays and allows setting the priority for a specific a=
lt-mode.
> > +             When read, it shows the current integer priority value. L=
ower numerical
> > +             values indicate higher priority (0 is the highest priorit=
y).
> > +             If the new value is already in use by another mode, the p=
riority of the
> > +             conflicting mode and any subsequent modes will be increme=
nted until they
> > +             are all unique.
>
> What is the units here?  0 is highest, what is the lowest?  What is the
> range here?  I can't determine this from the text, sorry.
>

Hi Greg,

You are right, the lowest range is not specified; the only note is that
the value should be an integer of 0 or higher.
The mode selection algorithm does not impose a maximum value. It
operates with any priority values returned by kstrtouint(). Any MAX
value would require an explanation as to why that specific value is
the maximum, and I do not have such an explanation. The only
restriction is that it must fit within an unsigned int variable, which
is checked by kstrtouint() against UINT_MAX.

> > +
> >  USB Type-C partner devices (eg. /sys/class/typec/port0-partner/)
> >
> >  What:                /sys/class/typec/<port>-partner/accessory_mode
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index 9f86605ce125..aaab2e1e98b4 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -19,6 +19,7 @@
> >  #include "bus.h"
> >  #include "class.h"
> >  #include "pd.h"
> > +#include "mode_selection.h"
> >
> >  static DEFINE_IDA(typec_index_ida);
> >
> > @@ -445,11 +446,34 @@ svid_show(struct device *dev, struct device_attri=
bute *attr, char *buf)
> >  }
> >  static DEVICE_ATTR_RO(svid);
> >
> > +static ssize_t priority_store(struct device *dev,
> > +                            struct device_attribute *attr,
> > +                            const char *buf, size_t size)
> > +{
> > +     unsigned int val;
> > +     int err =3D kstrtouint(buf, 10, &val);
> > +
> > +     if (!err) {
> > +             typec_mode_set_priority(to_typec_altmode(dev), val);
> > +             return size;
> > +     }
> > +
> > +     return err;
> > +}
> > +
> > +static ssize_t priority_show(struct device *dev,
> > +                           struct device_attribute *attr, char *buf)
> > +{
> > +     return sprintf(buf, "%u\n", to_typec_altmode(dev)->priority);
>
> For new sysfs files, please use sysfs_emit(), otherwise someone will
> come along with a janitorial patch to fix it up after it lands in the
> tree :)
>
> thanks,
>
> greg k-h

I will change it, sysfs_emit instead of sprintf.
Thanks!


Andrei

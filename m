Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C227B
	for <chrome-platform@lists.linux.dev>; Thu, 30 Jun 2022 17:13:38 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-317a66d62dfso185821347b3.7
        for <chrome-platform@lists.linux.dev>; Thu, 30 Jun 2022 10:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5wbVnB9JXd2WFukFG87rkbpuCu8ljUUZ2a2nEUPVBiI=;
        b=Wljl2fDN1PoFOcQQnC0+Se3tn48Vi1gCJaFUSK1BM2JnXaPC4srY60jaAXXLHqUmmK
         Dk1JMzYTq7FF7SIL7nvY46II4eACkWpMLz2EBMWzITLtdwAvA9Uy2g54/huf3BJq52Aj
         QzizP073+OeEZ0hQvd4fv5lDjfuWPUjxrAI7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5wbVnB9JXd2WFukFG87rkbpuCu8ljUUZ2a2nEUPVBiI=;
        b=66HsQz+StVevtOJMei7QWicg5Xuu3KsPN66kytJ084y1pmy/yJyOcBMdtAqKUCVoU1
         XQcTwwXWR88ac4mej4QrqzxzNxr8LZEZAYkQ1TlwiGrsR8P2GODSQzWX4QkkhGR5qrNm
         XLN2nDm8LpVv6H5A05PITip3vOTvgdz7iKKVFPpA9NpjYuoMTchBsHrlK8/HFs2sNWIJ
         QNNaQxOYRCSufvbPIXrseM+KjZ7oZhlwwoWqoARlvsa6Ob7X9AYKEKesgCPFi+mGJJYH
         c/Lp6Urbx0ywneAj8GUD+suFLzCwvQpXn2YOi+OCSwVbxsoX47sPM6bKGAbajaJux/40
         mVzg==
X-Gm-Message-State: AJIora877QeufjujmXKfnBnH1a20sKvTYj4guYjMfvnh63Q93XRInc4R
	WtivUNBCCMx+t6NRyCbYli6SVqbgXU9Z6G86QyF9qg==
X-Google-Smtp-Source: AGRyM1urYM7GEZ3MU1i8Nsz5L4MMmVmjO5EmdSKxPSy9gvRW7I1DfQyg2AGkklRJ6ZlRH66TstGV8Md3787unfdbDk0=
X-Received: by 2002:a81:8a44:0:b0:31b:c2d1:43a4 with SMTP id
 a65-20020a818a44000000b0031bc2d143a4mr11847676ywg.387.1656609217887; Thu, 30
 Jun 2022 10:13:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220629233314.3540377-1-pmalani@chromium.org>
 <20220629233314.3540377-2-pmalani@chromium.org> <Yr1cN1I14BR6rN3U@kuha.fi.intel.com>
In-Reply-To: <Yr1cN1I14BR6rN3U@kuha.fi.intel.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 30 Jun 2022 10:13:27 -0700
Message-ID: <CACeCKad3NFBEtWUN6P7WOa5W-_K_+Th2mBOKxiziPJCA8+oZUQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] usb: typec: Add support for retimers
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, bleung@chromium.org, 
	Daisuke Nojiri <dnojiri@chromium.org>, "Dustin L. Howett" <dustin@howett.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <groeck@chromium.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Hi Heikki,

Thanks for taking a look.

On Thu, Jun 30, 2022 at 1:18 AM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> On Wed, Jun 29, 2022 at 11:32:19PM +0000, Prashant Malani wrote:
> > Introduce a retimer device class and associated functions that register
> > and use retimer "switch" devices. These operate in a manner similar to
> > the "mode-switch" and help configure retimers that exist between the
> > Type-C connector and host controller(s).
> >
> > Type C ports can be linked to retimers using firmware node device
> > references (again, in a manner similar to "mode-switch").
> >
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
>
> Cool! This looks really good to me.
>
> I'll add Mika here, just to keep him in the loop. Thunderbolt/USB4 can
> control the same physical retimers over the SBU line. Right now there
> is no conflict, but I think we want to later be able to use these
> devices to upgrade the retimer firmware, and that is something that
> the Thunderbolt/USB4 already does. So let's keep an eye on this.
>
> I wonder, would it make sense to later make the thunderbolt_retimer
> devices also part of the device class that's introduced here? I think
> that way it would be easier to later figure out which
> thunderbolt_retimer and which retimer_switch represent the same
> physical retimer. And perhaps it would also be more clear for the user
> space to have a single device class for the retimers?
>
> Maybe the device class could be named just "retimer", and the device
> type could then be named "typec_retimer" instead of "retimer_switch"?

Sure, I will make this modification in v2.
I assume we can still keep the firmware node handle as "retimer-switch"
to keep it aligned with "mode-switch" and "orientation-switch".

Thanks,

-Prashant

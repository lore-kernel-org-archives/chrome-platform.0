Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A577B
	for <chrome-platform@lists.linux.dev>; Thu, 30 Jun 2022 17:16:12 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id v185so25394683ybe.8
        for <chrome-platform@lists.linux.dev>; Thu, 30 Jun 2022 10:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o8689H0UAxz4K3OeSIRtr+YJ/Xi+oP67C+537YTthgw=;
        b=j9La2LdEFflVgzA2Rowu6dp2UY6aqc8v3FgtGD451eUdnEGBi8rD/KNhAXxKLJrRpc
         /GnohVyDXhKFZlxjAyiN07Ulvf4ZV21iDtYe2inkkIohq4Z/yKlaUyW9jep0T7UdwBe3
         /0GmkgbHF5cpsJgpAVcNHmWeAGYebStTf2AB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o8689H0UAxz4K3OeSIRtr+YJ/Xi+oP67C+537YTthgw=;
        b=zHlIeNWlVCTdkndro1dTHXB2/magMZp+cBMlWaB6gEuDdgpD89Bnm6XpJFVkP2LqWW
         liWjY0UkdPAcRW+Gn7FaFFsVp20gwbXkI5Rc5HNoERUX/lKnv3ZhFKyJMa1SMOs/egjW
         h+mdtcV4gmiIYTRjqeXqGvTrqQMCY0d5YWKZBKAxW86YkzH+xZXbc8uTN0eSqjx5kzeP
         /wq1mbxjaDD9N/KMSe4lbBSlusruEzLv1/NKXSRTcmsld7vh4gfc6mxJIgyDERzjJDxn
         vf/9UEk2mGnbFozB4tnSVhgfR9rA7TQcKOle4v2Sp8Y1zOrc08eHPGSRgbmfKd9ZxkHn
         Edow==
X-Gm-Message-State: AJIora9MVP1mP+470yj8fXYhKi7JyCy4ebumhLZ8eDV8cwpOb4km0oP1
	1dMqZB6Y/Rqc/dazHx7F2yCitGii/e0MEDdg94xyuw==
X-Google-Smtp-Source: AGRyM1vzAQkoR46IuHMPKY/cJIhI/I67AUHel/vX9VgQIYI8WXB81cA8Ur31ZAjWpMDR7uLSh0OqyBpGAkc91RCMG6g=
X-Received: by 2002:a25:b9c7:0:b0:66c:e02d:9749 with SMTP id
 y7-20020a25b9c7000000b0066ce02d9749mr10919746ybj.494.1656609371601; Thu, 30
 Jun 2022 10:16:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220629233314.3540377-1-pmalani@chromium.org>
 <20220629233314.3540377-3-pmalani@chromium.org> <Yr1eW1gHR7LGP70Y@kuha.fi.intel.com>
In-Reply-To: <Yr1eW1gHR7LGP70Y@kuha.fi.intel.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Thu, 30 Jun 2022 10:16:00 -0700
Message-ID: <CACeCKadQr4m_OK92GmVefJDS4d-3+E2WkW=YzVnoYkbmXzwESw@mail.gmail.com>
Subject: Re: [PATCH 2/9] usb: typec: Add retimer handle to port
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	chrome-platform@lists.linux.dev, bleung@chromium.org, 
	Daisuke Nojiri <dnojiri@chromium.org>, "Dustin L. Howett" <dustin@howett.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <groeck@chromium.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook <keescook@chromium.org>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>
Content-Type: text/plain; charset="UTF-8"

HI Heikki,

On Thu, Jun 30, 2022 at 1:27 AM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi,
>
> On Wed, Jun 29, 2022 at 11:32:20PM +0000, Prashant Malani wrote:
> > Similar to mux and orientation switch, add a handle for registered
> > retimer to the port, so that it has handles to the various switches
> > connected to it.
> >
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
> > ---
> >  drivers/usb/typec/class.c | 8 ++++++++
> >  drivers/usb/typec/class.h | 1 +
> >  2 files changed, 9 insertions(+)
> >
> > diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> > index 2fa0b3718d23..2bc5fbdb25dd 100644
> > --- a/drivers/usb/typec/class.c
> > +++ b/drivers/usb/typec/class.c
> > @@ -12,6 +12,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/usb/pd_vdo.h>
> >  #include <linux/usb/typec_mux.h>
> > +#include <linux/usb/typec_retimer.h>
> >
> >  #include "bus.h"
> >  #include "class.h"
> > @@ -2249,6 +2250,13 @@ struct typec_port *typec_register_port(struct device *parent,
> >               return ERR_PTR(ret);
> >       }
> >
> > +     port->retimer = typec_retimer_get(&port->dev);
> > +     if (IS_ERR(port->retimer)) {
> > +             ret = PTR_ERR(port->retimer);
> > +             put_device(&port->dev);
> > +             return ERR_PTR(ret);
> > +     }
> > +
> >       ret = device_add(&port->dev);
> >       if (ret) {
> >               dev_err(parent, "failed to register port (%d)\n", ret);
>
> I think you need to release the reference with typec_retimer_put() in
> typec_release().

I knew I was forgetting something...
I'll fix this in v2.

>
> I guess we can look handle this later, but there can actually be two
> onboard retimers for each connector.

You're referring to the cascaded case right? OK, I'll bear this in mind for
later series (right now the EC exposes just 1 interface for retimer).

Thanks,

-Prashant

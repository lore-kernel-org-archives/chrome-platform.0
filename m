Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A296AA922
	for <chrome-platform@lists.linux.dev>; Tue, 31 Jan 2023 18:21:45 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-51ba4b1b9feso41141987b3.11
        for <chrome-platform@lists.linux.dev>; Tue, 31 Jan 2023 10:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X7pBEKn4xB6KlSsgM67ywt4YhFhtJVw3vFCQK0MunrU=;
        b=a54hMh4vQaR+SnfjHs+/tTs9WgpKM8eRewGPeGHtO7AfZ8B/IoHcC+VUKcnOuN5Or2
         g3wtl9gka5vLbNzdzK0Z8kf4V6iYujZeIMwawJr/r3r1CE+1IWzIIBDmnqRsxAwO4NLR
         P4J8TjE6RgzBp3wtbZc3nCLGKZ6aP+sOHUq9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X7pBEKn4xB6KlSsgM67ywt4YhFhtJVw3vFCQK0MunrU=;
        b=xIqQUWqJFnH1OVtzoSjWS4CgHMB0xkwfslJdmPgfjOerUW82qOT30ZdlHh+vuKXGxT
         dSkYGSUT2GpPWLPylw57dBs/ZryGNEwtyxL4D5pVnHW3Tp7aBFzTkiISjc3GC9e8FNqc
         g5xusOxGWZkllnsKXdXfTWXIs9Q1DyV/L/m38DibVYifIpLOMNysVeBQQ1BL0zyeb+E5
         879SoOaP/PwrnV9cy82yu10oCn9VxmVn17TT4Ak11TzTyZ3hUI+U5A4Hr7wDTSxW/c3F
         ncBTpIkIqsviMtof81QCJC7p5WjLJkbJUiOosbYbfN31GcPG9WfokjmhiEmjUngthomM
         xYUw==
X-Gm-Message-State: AO0yUKXiDppCsu9ovrBDm3hAnKyGu+gDT0l7PCCY3jXTqXSd2e5uxL/Y
	bhMGaeYCcQBqChlb1xaxyJn0c2UgNtGX/P0R0LI2ug==
X-Google-Smtp-Source: AK7set/2RMPBY9eBahBTJEvy3rYfwwbLjgi7c1vRDs5ESG4HcYXd5DGekbUkiWg0DHXub99IRVG7DJ9cLcGN4Xa6sZ4=
X-Received: by 2002:a0d:d7cf:0:b0:50f:ba3b:8a0a with SMTP id
 z198-20020a0dd7cf000000b0050fba3b8a0amr1346075ywd.181.1675189304668; Tue, 31
 Jan 2023 10:21:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230126205620.3714994-1-pmalani@chromium.org> <Y9iIzcz5AGjVXsNG@google.com>
In-Reply-To: <Y9iIzcz5AGjVXsNG@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Tue, 31 Jan 2023 10:21:33 -0800
Message-ID: <CACeCKae0s21=tj4pKvm3SyU-AUxB67oH=vO3ihHTSQ31d26ZDg@mail.gmail.com>
Subject: Re: [PATCH 1/2] platform/chrome: cros_ec: Add VDM attention headers
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	bleung@chromium.org, heikki.krogerus@linux.intel.com, 
	Daisuke Nojiri <dnojiri@chromium.org>, "Dustin L. Howett" <dustin@howett.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guenter Roeck <groeck@chromium.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Lee Jones <lee@kernel.org>, 
	Tinghan Shen <tinghan.shen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"

Thanks for reviewing the patch, Tzung-Bi.

On Mon, Jan 30, 2023 at 7:19 PM Tzung-Bi Shih <tzungbi@kernel.org> wrote:
>
> On Thu, Jan 26, 2023 at 08:55:45PM +0000, Prashant Malani wrote:
> > Incorporate updates to the EC headers to support the retrieval of VDM
> > Attention messages from port partners. These headers are already present
> > in the ChromeOS EC codebase. [1]
> >
> > [1] https://source.chromium.org/chromium/chromiumos/platform/ec/+/main:include/ec_commands.h
> >
> > Signed-off-by: Prashant Malani <pmalani@chromium.org>
>
> With a nit:
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
>
> > diff --git a/include/linux/platform_data/cros_ec_commands.h b/include/linux/platform_data/cros_ec_commands.h
> > index b9c4a3964247..ec327638c6eb 100644
> > --- a/include/linux/platform_data/cros_ec_commands.h
> > +++ b/include/linux/platform_data/cros_ec_commands.h
> > @@ -5862,6 +5862,7 @@ enum tcpc_cc_polarity {
> >  #define PD_STATUS_EVENT_MUX_1_SET_DONE               BIT(5)
> >  #define PD_STATUS_EVENT_VDM_REQ_REPLY                BIT(6)
> >  #define PD_STATUS_EVENT_VDM_REQ_FAILED               BIT(7)
> > +#define PD_STATUS_EVENT_VDM_ATTENTION                        BIT(8)
>
> This has an extra tab if comparing with others around.
Fixed the tab and applied to chrome-platform/for-kernelci.

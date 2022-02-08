Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C752F2C
	for <chrome-platform@lists.linux.dev>; Tue,  8 Feb 2022 06:15:24 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id e145so26889173yba.12
        for <chrome-platform@lists.linux.dev>; Mon, 07 Feb 2022 22:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I8+dQJhsjqqbxKuceiXCXbyjwpL8VMS5N/fsdGvmZH0=;
        b=OgWTF52eBDySkOlE6VvK0QUJlyMrcqpuR5p2rp5xD7iDxchWUWAm021yvSJN6vk++c
         qmL5N2DDvvVTz3LVAEBvh4BmWE5iu2IGdjfnxLN722L81snTdYxUT5ngwJDmKrc/4beE
         pW+jx1nZPWn/0NThjLMQ4pSpZhdQhfDasokok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I8+dQJhsjqqbxKuceiXCXbyjwpL8VMS5N/fsdGvmZH0=;
        b=mMKb0jBpZ/sVdw2rzg8ouxRQR64IxWtZC/cTZk5kP5F6XiWmKQssP0wIiErczUQ/bx
         pOZ2ok+krE10TBWS/jrpT9Z45hGuBSM5SEPvxkTsLauljqICCKTIZQyew8gOOBe4fcX9
         m5kAlEBMdOAL0fEbPPeNm44K5DOGzICAG0vxrtRcYLL3jndFqEMrCJkekgCzBd5uE4WC
         tkHBHrJPF9jT2C2Owf0qNgVXXa8i+ffS+iR8w6JbWF4wsdj93l+SKVzGtkHccJjUYjDo
         lSc9po60jFVBoDNOZA6wA1Mq+n4Rtjj9evOwYyvfrn30b0WYoHVrNQVTfXPTxBYqZSKs
         H3RA==
X-Gm-Message-State: AOAM533SRc8+PHpNLN4TdnImUvH3rIiippcWcBK8IIoy5DzAr8BVHcak
	wby6hrYWgYjKbAhN9Pn0b7nE31gmw2chhR3E2EQXAjThk7I83Q==
X-Google-Smtp-Source: ABdhPJwb83sfyn4nAn4uchT/JF8O2drzC/LsS7VmMws6TjmKzUL7JJM+Sr3zPKZYK+tf7SPUsEoc9jmVmQhaB+Kntt8=
X-Received: by 2002:a25:ae25:: with SMTP id a37mr3201580ybj.646.1644300923353;
 Mon, 07 Feb 2022 22:15:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220207214026.1526151-1-pmalani@chromium.org>
 <20220207214026.1526151-5-pmalani@chromium.org> <YgIB8N6fjxWcKK9/@google.com>
In-Reply-To: <YgIB8N6fjxWcKK9/@google.com>
From: Prashant Malani <pmalani@chromium.org>
Date: Mon, 7 Feb 2022 22:15:12 -0800
Message-ID: <CACeCKafPyaT9-raroFh-UTunq93Yvh-uPb29oF9NbGZRZjv=Yw@mail.gmail.com>
Subject: Re: [PATCH 4/4] platform/chrome: cros_ec_typec: Update mux flags
 during partner removal
To: Tzung-Bi Shih <tzungbi@google.com>
Cc: linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, 
	"open list:CHROMEOS EC USB TYPE-C DRIVER" <chrome-platform@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi Tzung-Bi,

Thanks for reviewing the series.

On Mon, Feb 7, 2022 at 9:38 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
>
> On Mon, Feb 07, 2022 at 09:40:30PM +0000, Prashant Malani wrote:
> > In cros_typec_remove_partner(), we call
> > cros_typec_usb_disconnect_state() which sets the switches/muxes to be in
> > a disconnected state. This also happens in cros_typec_configure_mux().
> > However, unlike there, here the mux_flags variable hasn't been updated
> > to reflect that a disconnection has occurred. Update the flag here
> > accordingly.
>
> It is fine (at least to me) usually.
>
> Since you would need to respin the series anyway, s/Update/Updates/.

Again, "update" is fine. Please see:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

Quoting from the above: " Describe your changes in imperative mood,"

So, imperative usage is actually preferred, and "updates/makes" is discouraged.

(I grabbed an older version of the documentation in my other replies,
but the description is the same).

Thanks!

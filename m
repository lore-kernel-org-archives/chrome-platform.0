Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8B213AD38
	for <chrome-platform@lists.linux.dev>; Thu,  4 Apr 2024 20:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712263508; cv=none; b=u24GSXUAHvFeBwdbGUKmnZ34Q5YalobxPMFS8J3V/1XXbqMTIULYinizZzPn9UoEnQURrWzjK5bEEXc+jbG1F3KRngKk22FnjAkwsCiTuzMd9V/xfYFpADAcfjjfmHyDH/zLsPzmJyuwbI8Oyz+QILT2FOU2rbCpUydOp9uIh4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712263508; c=relaxed/simple;
	bh=4UO1VMYWun6t0P6nH+mG+xdFydZVyE+pOaRYVYx4yog=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PRMsZlP42Et94xpdCAfFPHRd76oKxtKGjv77uLoDcUmU6bYKo9sbw5Km8K7rJdbzgxxShrz0a6S38FqKB3ZnX+0e9HB4E1BP1pQXed2CmX0klS1+AkFBGn9PDxxhZsFxmZBt6j/sSN3nB0jOP3kizcf3TY+zPsVzj5nXrHHwsRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B69+h5mn; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B69+h5mn"
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4d435a60217so512563e0c.0
        for <chrome-platform@lists.linux.dev>; Thu, 04 Apr 2024 13:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712263505; x=1712868305; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KF8FNJKbIf/Wqy3NgLHLUIDfVpXMUebZHQXlpWQnHwE=;
        b=B69+h5mnNoTkDTxkoYBdRk2I3+00PTNZAeiLqxG8bxy/yVuI1MbcUqywHNOIydL2Lr
         7+Dp2RO82ChnY4b3HHmtk38qLtb0pbEEJWnn7Dumqo1EwAkVZ9DIg+b/IcoFrF2kXb9u
         O8yHhcNJ0Co5pT1nZcvMQ0Gtpp6dtnJBxDpfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712263505; x=1712868305;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KF8FNJKbIf/Wqy3NgLHLUIDfVpXMUebZHQXlpWQnHwE=;
        b=WU06Dp4dQ1uEXs5dwK2hK6+Z8TfcOW0Limcy3YEyvWQ3ATIi6xFxF3BpIZefVKB0ty
         zmZ9vIU5zZ5j80GApIsA81vtyfMUM2r4h6hb0A8qFPRIxasWggdu/GzQJxZWjoTPK6wm
         ftUSvLAh6zRW4+TsXU+7p5S7Y1KMcDkJ5OSSVAkRlo1gCD4r8FIecB1uXNQF9T4yRZVF
         XlFiuXEZxeaqwQZAkCVJoRccC0oyhUsBsdbyEG4RIMt+mT6vFZnMFZzMkygU2EtYFq9w
         NImRpPCgfOqhYCt7Y0Uly2z+EdJ0tYD7kbCqYVGcRlnuxYQbQ/KfW+jkwKQBJRSfCAHV
         HJkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfejHA/IxhlgGPaFtoPmkwSum/3dkfgD6L6clZQ10twBuhoSuLNPZdvKAj7tdrpkXI2xMCPgtef29+z70uj9TOVf/j+qbfF4aplpsK7/oc
X-Gm-Message-State: AOJu0YwMb9Hi2BH0zh1Qy/HM519A2IG6LnegLv0qVDVMdWlVDGKUoiWP
	Je8uzGKaZQunpVGYkCgl/BMfhQnNjnkw4F7z6TlYJYc3zKACQ9WN7mgbZ3sp5e34aIqZrrR/Riy
	FNNy3RttrI+re+1Gqv72t7y43hlXr/OqtY9I8sWM/5Gy6r0M=
X-Google-Smtp-Source: AGHT+IE1aT12rSJQsk49m0s1WDAmGtg1boyflA0mWV27eiMvdQWflqasXIA0kULyhEfYJsr1EVtT0Cfl08bXuJZCc+c=
X-Received: by 2002:a1f:f2c6:0:b0:4d3:3adc:b639 with SMTP id
 q189-20020a1ff2c6000000b004d33adcb639mr3392151vkh.6.1712263505418; Thu, 04
 Apr 2024 13:45:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240403-public-ucsi-h-v3-0-f848e18c8ed2@chromium.org>
 <20240403-public-ucsi-h-v3-2-f848e18c8ed2@chromium.org> <3ezjocthsigo3t746slmgzffnmpxw7wwf3s535basiaf2qy6io@7ocxva6ndsbt>
 <2024040449-average-foyer-defa@gregkh>
In-Reply-To: <2024040449-average-foyer-defa@gregkh>
From: Pavan Holla <pholla@chromium.org>
Date: Thu, 4 Apr 2024 13:44:29 -0700
Message-ID: <CAB2FV=4TQZwM6bRSeBhieqU2H8yxt3NWsey55a5my_i1La0fJQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 4, 2024 at 6:07=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Apr 03, 2024 at 09:58:33PM +0300, Dmitry Baryshkov wrote:
> > I think it's better be written as
> >
> > if (WARN_ON_ONCE(val_len > MAX_EC_DATA_SIZE))
> >       return -EINVAL;
>
> So if you trigger this, you just rebooted all boxes that have
> panic-on-warn enabled (hint, the HUGE majority in quantity of Linux
> systems out there.)
>
> So don't do that, just handle it like this.
>
> BUT, if this can be triggered by userspace, do NOT use dev_err() as that
> will just allow userspace to flood the kernel log.
>
> Pavan, who calls this?  If userspace, this needs to be fixed.  If it's
> only a kernel driver, it's fine as-is.

This code is only called by a kernel driver.

Thanks,
Pavan

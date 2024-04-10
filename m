Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4015184127
	for <chrome-platform@lists.linux.dev>; Wed, 10 Apr 2024 22:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712788102; cv=none; b=RRqcTaH+EAQngZPEAwIXQg/Bw6Bgc0KPqQb9aiLWxzuACW1xox2CR3iQOIobRKsDCf6H4UPkdussiP7gr08qydSlBzrBmFNimRWehQIjxXJR9vC9xnSvvADxJbjRTmKFXDn/uQVXvoW3avG5nIasbhMoj4Zu4SCVoE7drAl9al0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712788102; c=relaxed/simple;
	bh=YH+YCK0TtaM4xpNLgp7r4l7WLrbNv3kRu3yjDoe624s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b7lQ/EwhRxBSvjOuEQwlRUcKJCXCLY31Smd07fkQbT4nDKQjS57RZzMBPaV729mSlxFEuUlHUldzAlnddrWQzEm7dm8OvPHsZdA157RWUjz7Umo1dlz6WSZ4AmuKxQ1oiKeSrWPuNrQS2jOvJ+qdwELJa5hn5Tr2teXCkR52R30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=InIOGswO; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="InIOGswO"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-7e74f4ae8fcso767598241.2
        for <chrome-platform@lists.linux.dev>; Wed, 10 Apr 2024 15:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712788100; x=1713392900; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BB3ccNjO9MqZA0XBab5NYc/mwf8q7S7CIiocRg95hpo=;
        b=InIOGswOAcyK/wInfOaYLRomQi6ZBawu1ssfjCcXK7zX+h6/QJ7TuUFTf3DgAltQvN
         nLjihzaHdklFHhfT7Lh1wvlFXikLDFrdqbayOFO4l72Ew8VNuEh8UhUyNIk+zFOwBbr1
         /41+XEkRcbuUvSzyWhlkJBp+f1LA/5m1RvJU4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712788100; x=1713392900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BB3ccNjO9MqZA0XBab5NYc/mwf8q7S7CIiocRg95hpo=;
        b=nLuJ2AO8shj4HYyk1trd5H2mVp4+rZkVIcfTjsqaWI1+ueQH757otp2w/uLkJiIqwj
         SYMxSIJD2OSXvknRFqGcqMQQa+lysAwMNV7uPHBER7OFEhyLzeQ0RMS1fWJKhsXRAyLC
         MLqmcq7R3wcsHs0xNqdrnIpIKQ3a39QcIBbIkWauBNr4t8LrZlMZsaB1z6G20+kCDSm3
         8qiYdxfGitzAE6HlvBDOlpmXZAxH6Sy+bjGEczjJBS422fw9b7q6cZ/HFvU5Vp+qNYtA
         GLg8ffgjZRkPqaJnpjdCaqd/z5OEvW/PCmfwz/CfEvfALACU+byK1eN2++ZJqFj1jQoh
         S0rg==
X-Forwarded-Encrypted: i=1; AJvYcCUf8mvUdsfN2HFlRxlxdOCQVO4OYtdkM4nldtUcKl9ZEDp68aBOn5VTL20bPsNfrSx5Q8WuswKFpi5ie+4v3JNhho7wW6QxeOBNIwQ4j1ai
X-Gm-Message-State: AOJu0YxwViSFPlSksc5SPlDtVAZjk8AxkSEwKEdzYyDCZ+lS9VRoleHi
	UnasH6jqBBzDNIcQ5pRNGYYvSTATVjl6BEWx+ObdVCwShrjlzn+97ERJLCsIUKZlQaMWaeosCQO
	1SdL1eBV7gamFtolkG3SJIJqGtFhXMRNTEL/V
X-Google-Smtp-Source: AGHT+IG0DYJSZA6M/0G7T2aTS2ZJ/iILrEXt6TniERHXXkQOUOrG3LvxlW3P/tXtGQZaaYSu1vjHu2wxuT1qlaAsDFc=
X-Received: by 2002:a05:6102:2092:b0:47a:23bb:5302 with SMTP id
 h18-20020a056102209200b0047a23bb5302mr3103418vsr.11.1712788099606; Wed, 10
 Apr 2024 15:28:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240409-public-ucsi-h-v4-0-e770735222a2@chromium.org>
 <20240409-public-ucsi-h-v4-2-e770735222a2@chromium.org> <2024040916-kleenex-machinist-4858@gregkh>
In-Reply-To: <2024040916-kleenex-machinist-4858@gregkh>
From: Pavan Holla <pholla@chromium.org>
Date: Wed, 10 Apr 2024 15:27:43 -0700
Message-ID: <CAB2FV=6We88NrvN8NZYt8NkMFH9N_ZBGyUWVUpGwPdja2X_+NA@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] usb: typec: ucsi: Implement ChromeOS UCSI driver
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Benson Leung <bleung@chromium.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I plan to upload the next version after related EC changes land on
ChromeOS. That might take a few weeks.

On Tue, Apr 9, 2024 at 8:16=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Apr 09, 2024 at 02:27:37AM +0000, Pavan Holla wrote:
> > +#define DRV_NAME "cros-ec-ucsi"
>
> KBUILD_MODNAME?

Will replace DRV_NAME with KBUILD_MODNAME.

> > +
> > +#define MAX_EC_DATA_SIZE 256
> > +#define WRITE_TMO_MS 500
>
> What are these and why these values?  And tabs perhaps?

MAX_EC_DATA_SIZE is the number of bytes that can be read or written to in t=
he
UCSI data structure using a single host command to the EC.
WRITE_TMO_MS is the time within which a cmd complete or ack notification mu=
st
arrive after a command is sent to the PPM.

Will add comments and tabs.

> > +     uint8_t ec_buffer[MAX_EC_DATA_SIZE + sizeof(struct ec_params_ucsi=
_ppm_set)];
>
> That's a lot of data on the stack, are you sure you want to do that?
>
> And are you sure you are allowed to have this data on the stack?  It
> never ends up being sent using DMA?

I confirmed that this data isn't DMA'ed. However, I don't mind putting
it on the heap, and will do so in the next version.

> And please, don't use non-kernel types like "uint8_t", use "u8" like
> intended.  This isn't userspace (yes, I know a lot of kernel code uses
> these, but as you are going to change this, might as well change that
> too.)

Ack.

Thanks,
Pavan

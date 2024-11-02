Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAF21922D6
	for <chrome-platform@lists.linux.dev>; Sat,  2 Nov 2024 14:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730557800; cv=none; b=HvdfUw9ox+acfz/GjixzxRbDmg62BV/kW5xrFxeNISLPNyJgfZca6SFIyaAU8eAnDsyYqJSg4HcCjXxwTdpyUMbHSgFlX703Hbxg74AflQEzo1GsxQooOjmB1wTaIqfm2/6aLsnptztzbQ08yomH+5gWLlA8tKd5nLKLC6cikpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730557800; c=relaxed/simple;
	bh=2UVnWDWLwjZZg8pZVfZsO0SQswQZMcoz+OATPckU8PI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tsZUI/UoAtzHk3VQWa5Fx32VvvHaKizaYbuT9aEsMRHb29CCfvx7VywjE4WGmsWCqBabXzAfI1ipDSoUoaxDGXpxfWWPdcQA/0NO7mFbq5JnvgrvgPSiMVCPk/ACCjWsv2kVxG9VFAv3qF2g40STrVEzrcHgtll6baN0DQObtqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bwa0rqOC; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bwa0rqOC"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9e71401844so182664366b.3
        for <chrome-platform@lists.linux.dev>; Sat, 02 Nov 2024 07:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730557794; x=1731162594; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3OMGiouzrJ8irZX2X/fJQXvldwhLjCzScMS8OtJ3x8=;
        b=bwa0rqOC+hkAisoJXMoglaxKsdoDOM+ZDGDZRe755G7qYyziTxRYu5scQ4uZRZEFNc
         a+FMubFJmBoL5kuAT7vAY0e6gk7Pn/8X2DESQFj/Q2W5rGOwZdiPql3iBl0L1T81rbXs
         +LI7Mg0m3PNmUn23vG2aMo6o8NFhjBne9TZcZJVs5yJxlmOWWJWYr/SlGdDuDkuUUfiS
         /MoSLixu2d4uP3bNnHNPvqfZtciSKX9OShM61kl37iFCFcbBJLEQxw7ehKKVtIg24qdH
         91n1/I2H47N180jXYpD+0wW+o0AtU8xmSNlnR5NTZ2hpnxMmmZh8B9ddrxF7uYu/oouc
         e57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730557794; x=1731162594;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D3OMGiouzrJ8irZX2X/fJQXvldwhLjCzScMS8OtJ3x8=;
        b=OGBlks8T/8d2fLwBxTmBlvBvfILp1T5+S/yrXH9dWWcYAwe+sSDGqZIyJdEJmz1Kme
         jpzxbDd9JKGBbFpte9EgfEb7HNmWbRm2QVAD8/hbTlA/QtCdB/CyDpYTNdXS4bNqkYdk
         yoxwWIIviow7F6z3hA3AbmDY3JGpZ7wz6wVY2YulDTZhOXash0aGHU7UFMTZeU0HAT2f
         Ape1zSUzRcsWwuFUPbsLh1YbassYOeEyFHjo9fBBSTE9bZvPdrgSQfIBM+Fg4n74liP1
         OMONnaPSiv8Pdx5fxWIbiMECAWwumbEMv7PzlISh/Vj7hztfFsq3MtGnBQacCvjLzInR
         oVpA==
X-Forwarded-Encrypted: i=1; AJvYcCXILNaX0uKfgxuKviSzM8xFeoxgDs5aPXYdhYTHryy9o9V8A5xEhZBCkflQ0VhLt7J3VJDwnNaeKjOKUdG69Ik=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1obuOBueqNBPkwFoH4ykgr5ozrFbDRsJSqCAM2wR8Pi2JqyMA
	ohn76Ev/PXiSQwwrjbMRYxogGBb62z7uTJpmMmNYGTKdX4GnDW6YWZLyQ62b32+kogEbHORjkMM
	/5vw0TRBzfuJRi5aGxodZVFQbpiuuQuXmYpE89g==
X-Google-Smtp-Source: AGHT+IHmMaoPuHCX8oqUiJ2GAJojyzCvnKuAF650y2r5dVCpByhVut9O1RRSbUZGBDSt5PzipQLZjWLX9kkXAj3eKcA=
X-Received: by 2002:a17:907:94d0:b0:a9a:cf84:2e4b with SMTP id
 a640c23a62f3a-a9e50915893mr967262166b.25.1730557794334; Sat, 02 Nov 2024
 07:29:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241031-iio-fix-write-event-config-signature-v2-0-2bcacbb517a2@baylibre.com>
 <20241031-iio-fix-write-event-config-signature-v2-13-2bcacbb517a2@baylibre.com>
 <20241101164118.687be624@jic23-huawei> <4e4e5281-d489-42b5-b358-c44958cfa4f9@tweaklogic.com>
In-Reply-To: <4e4e5281-d489-42b5-b358-c44958cfa4f9@tweaklogic.com>
From: Julien Stephan <jstephan@baylibre.com>
Date: Sat, 2 Nov 2024 15:29:35 +0100
Message-ID: <CAEHHSva6+Br9rXE9n0wqXuwQqetXN=Ae5vg0rxmPRfCVdw9atA@mail.gmail.com>
Subject: Re: [PATCH v2 13/15] iio: light: apds9306: simplifies if branch in apds9306_write_event_config
To: Subhajit Ghosh <subhajit.ghosh@tweaklogic.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Mudit Sharma <muditsharma.info@gmail.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Anshul Dalal <anshulusr@gmail.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Cosmin Tanislav <cosmin.tanislav@analog.com>, 
	Ramona Gradinariu <ramona.gradinariu@analog.com>, Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Dan Robertson <dan@dlrobertson.com>, Marcelo Schmitt <marcelo.schmitt@analog.com>, 
	Matteo Martelli <matteomartelli3@gmail.com>, 
	Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>, Michal Simek <michal.simek@amd.com>, 
	Mariel Tinaco <Mariel.Tinaco@analog.com>, Jagath Jog J <jagathjog1996@gmail.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Kevin Tsai <ktsai@capellamicro.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le sam. 2 nov. 2024 =C3=A0 14:21, Subhajit Ghosh
<subhajit.ghosh@tweaklogic.com> a =C3=A9crit :
>
> On 2/11/24 03:11, Jonathan Cameron wrote:
> > On Thu, 31 Oct 2024 16:27:08 +0100
> > Julien Stephan <jstephan@baylibre.com> wrote:
> >
> >> Simplifies the regmap_wite if branch in apds9306_write_event_config.
> > Applied.
> >>
> >> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> >> ---
> >>   drivers/iio/light/apds9306.c | 5 +----
> >>   1 file changed, 1 insertion(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/iio/light/apds9306.c b/drivers/iio/light/apds9306=
.c
> >> index 8adc74040db2bddf93fbb773e3519abcc726b9a6..9c08e7c3ad0c17519689a6=
30d42fe9b90438dfe8 100644
> >> --- a/drivers/iio/light/apds9306.c
> >> +++ b/drivers/iio/light/apds9306.c
> >> @@ -1125,10 +1125,7 @@ static int apds9306_write_event_config(struct i=
io_dev *indio_dev,
> >>              }
> >>      }
> >>      case IIO_EV_TYPE_THRESH_ADAPTIVE:
> >> -            if (state)
> >> -                    return regmap_field_write(rf->int_thresh_var_en, =
1);
> >> -            else
> >> -                    return regmap_field_write(rf->int_thresh_var_en, =
0);
> >> +            return regmap_field_write(rf->int_thresh_var_en, state);
> >>      default:
> >>              return -EINVAL;
> >>      }
> >>
> >
> Hi Julien,
> Sorry for the delay.
> "int_thresh_var_en" corresponds to APDS9306_INT_CFG_REG bit 3 (Datasheet:=
 INT_CFG, Address: 0x19) which
> is a single bit value only. If user does "echo 4 > /sys/bus/iio/devices/i=
io:device0/events/thresh_adaptive_either_en",
> which trickles down to the "state" variable, do we really want to write a=
ny other value except "0" or "1"?
> Correct me if I am wrong here.

Hi Subhajit,
In drivers/iio/industrialio-event.c, iio_ev_state_store is actually
using kstrtobool to check user input, then gives the converted boolean
value to write_event_config.
So state is a boolean. By the way the purpose of this series is to
clean up code and use a bool instead of int for the state parameter.

So new code is equivalent to what was there before.
Cheers
Julien


> Regards,
> Subhajit Ghosh

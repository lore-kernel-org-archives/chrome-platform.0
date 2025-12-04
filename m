Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D590626560A
	for <chrome-platform@lists.linux.dev>; Thu,  4 Dec 2025 17:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764869269; cv=none; b=nXAZ6CaukK85dXmmzeht0GlQdR7YDWPgThSGeQfPuJ2TaZ8hFqL9XmCTtea1Nzqi5vuu/pZWPoB9/aPYPAFrkSY1cYdNkCV5AH6u6CVe6FAuJAUX4WHV5tOdS95FhZrVjCmJtsqRPHcbzmtxdixoFr9FrJUCnng4Bsb5ygWdIOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764869269; c=relaxed/simple;
	bh=eqGqlfJDwmZx0z2EPrh+1X/MhsQ0Fjhr6WonNR2+vaI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=fpNg5Gar66nqvPz+0iZ/82vKE2Ak56dr/VTVGMitd3QhRZeB8cHyCD137on3ht1N3sWerLd/qz9CbAtyz3RJZzJNpRV3uesGuhTE4FuVw6FFFrWgLYn/qURd5JZYfQPXfffUIfBi3CF5X0WjEia18JmNs/Ir8+LljNhUftsUK4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCdSYBau; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCdSYBau"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6420c08f886so1350650d50.3
        for <chrome-platform@lists.linux.dev>; Thu, 04 Dec 2025 09:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764869267; x=1765474067; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqGqlfJDwmZx0z2EPrh+1X/MhsQ0Fjhr6WonNR2+vaI=;
        b=TCdSYBau8F8az2J+rqv7hmr3wMLVLC8mOFZJE+DduU9MM9s1lxnfJD/YIg609Agh+u
         lCgamsmVRNQZv7H9KfVJwqbhtZkV7J7Gyji6lao7HU8ksLgnjkOSqdVtyED5lzOTsHPw
         RB3/UAZZP7NEIv7NasF48mrHJOtlgxCq/tZJC56e0Oo+ICYZrapevjK3vCm+CKO3wjRR
         fV/LwbAVJIbTpdJ1qIoaGPD7UhEzUYsuTVf01eJ7vv0WAB+8DnepdqPtVymzxyek0T3N
         VjgIZ/I5IeiOUV5TaJiG/QAXzA2+tma9T63RnvRX50J4+rVl34GxHtPQEjS4HsWGsawd
         LcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764869267; x=1765474067;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eqGqlfJDwmZx0z2EPrh+1X/MhsQ0Fjhr6WonNR2+vaI=;
        b=YkdN4TpUq8ycxUxshNG9ib9ktl5sBksd2VtyG7WhDPjQXlq5VY729u4KsieXQslTEi
         KFBeg7y6Yyj8BcsnIGHR8gxuuGDBrW0tEVzlh3YWlIcJpKVhuM4eigbP5Vu8mxXDYADt
         0efOAi78sSX7KGavTkj9Y7xeZr4ex61NLZL6GSlBBazrYGAZ4CT1L/1FSGXmAnChBt84
         TqM9n3JrLEAJsoZWBF62eCOA0/gA2UYGSnlToaOpmMEGhkhR0GggiPvt/pynrA/OMb5E
         HS9CK9Ddaq89PnbbDjbDotC5nxNvVzEQV7gkngszVp14vbv0RsWHW+hfbwvV4C/5VPJp
         0kuw==
X-Forwarded-Encrypted: i=1; AJvYcCVqwKYckPJO965TPVuWrXJnPCnxwnfZWQYhC2J4FT0DDajjZN3ZwOORx5HTCZAXezcfd304C/zuaJo1cxMgzrE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxnW3uFLV0APJNhBPcdNpuSL6yBORmc3bSQMf+kZYjhD9kqjlxN
	8nX7aQARDSnm6PjsJnYn9zU+rvz6/EP+KgH6BI46kz97xHo1oawoJEna
X-Gm-Gg: ASbGnctuRajxp5vu8AJoEaZd/gPg8vggGeMntR9wDWUs3w/Bqywl+0rnmwU0fWdGQ88
	z+3LGh50J4Y7fwYKI0mhKCWMTCP6QlGy8G9Sp1VeJ7avyyZh2O+pTe0W54S0RQVhDWFhRqn/Gwb
	CUXTxPE1Bw5pXz2JQyzCh0IjOk/jeWNqPcrGwcdjfWDiozWC+AlEFQE77yuOmMm1hU0ByWczUXp
	htggJ8iOWbzudPC0FdWmL/bokrQTcgnr8kKI4U1q7q7M12DUz4JHK9F6qojGpCbr1lYBPQot5tg
	51Uy/8Diz5tnt/ORTVa2KFEuettjL1/cfz5vq9In45I0mAgD+t8Dt7am6A1CVdsfD5zCVGuUr8o
	Ri3mUftE9bFJVIxUl9Bjbi4z+TZ4v1JTUpN5GzTpNWoTdEkfnbr3r03fJ0o6hxsUdpt/jOeGsoH
	sJE6eUMQ==
X-Google-Smtp-Source: AGHT+IFVmPrN9yCBS2cH9aAWPQBXj1xtArMxTEkDbv/AkGSDM9xx4AHqY9pQra4kUQ8H5Q/7FKOGIw==
X-Received: by 2002:a05:690e:1385:b0:644:43f7:11b8 with SMTP id 956f58d0204a3-64443f71711mr752690d50.13.1764869266395;
        Thu, 04 Dec 2025 09:27:46 -0800 (PST)
Received: from localhost ([2800:bf0:4580:3149:7d4:54b1:c444:6f2f])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c1b4ca7d4sm7528147b3.15.2025.12.04.09.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 09:27:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Dec 2025 12:27:43 -0500
Message-Id: <DEPLXUZ8UPY9.38K72YVMTF84W@gmail.com>
Cc: "David Lechner" <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, "Guenter Roeck"
 <groeck@chromium.org>, "Jonathan Cameron" <Jonathan.Cameron@huawei.com>,
 <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH RFC 1/6] iio: core: Match iio_device_claim_*() return
 semantics
From: "Kurt Borja" <kuurtb@gmail.com>
To: =?utf-8?q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>, "Kurt Borja"
 <kuurtb@gmail.com>, "Andy Shevchenko" <andriy.shevchenko@intel.com>,
 "Lars-Peter Clausen" <lars@metafoo.de>, "Michael Hennerich"
 <Michael.Hennerich@analog.com>, "Jonathan Cameron" <jic23@kernel.org>,
 "Benson Leung" <bleung@chromium.org>, "Antoniu Miclaus"
 <antoniu.miclaus@analog.com>, "Gwendal Grignou" <gwendal@chromium.org>,
 "Shrikant Raskar" <raskar.shree97@gmail.com>, "Per-Daniel Olsson"
 <perdaniel.olsson@axis.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251203-lock-impr-v1-0-b4a1fd639423@gmail.com>
 <20251203-lock-impr-v1-1-b4a1fd639423@gmail.com>
 <9562673ef83dd73b6092b5a7d2042b380a55700c.camel@gmail.com>
In-Reply-To: <9562673ef83dd73b6092b5a7d2042b380a55700c.camel@gmail.com>

On Thu Dec 4, 2025 at 9:23 AM -05, Nuno S=C3=A1 wrote:
> On Wed, 2025-12-03 at 14:18 -0500, Kurt Borja wrote:
>> In order to improve API consistency with conditional locks, use
>> true/false return semantics in iio_device_claim_buffer_mode().
>>=20
>> This also matches iio_device_claim_direct() return semantics.
>>=20
>> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> ---
>
> Even if the rest gets a NACK, I think at least this patch makes sense. In=
 fact I
> would even extend it so that we have the same inline API with proper anno=
tations:
>
> https://elixir.bootlin.com/linux/v6.18/source/include/linux/iio/iio.h#L67=
9
>
> So it really has the same semantics as iio_device_claim_direct()

I agree. I will include that here and just call it match semantics.

>
> - Nuno S=C3=A1


--=20
 ~ Kurt


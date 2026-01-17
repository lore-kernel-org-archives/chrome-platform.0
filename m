Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895F32E1758
	for <chrome-platform@lists.linux.dev>; Sat, 17 Jan 2026 19:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768679115; cv=none; b=EDxyCRvH63BpygKTA5+fcGiqP1ku4Lqkx3+RU7Dm7MhWrqiCqKyduCnTsLa/ntgTjtj+/zjyvuM7L4i8yPkp0CCnhA9bwnaB/cTbcA+G0MKjSxMzn8HvoM03Tf8RJoml5zZY4exLxSPs4NSdIE7rzBQ2jn1zJ+w5FZhItKTEkX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768679115; c=relaxed/simple;
	bh=jpqBLBtcKEzVsS7UF6kIY4x735PGlJz3V7jBe9IpCYY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=nTHInBJ16wmWVj7fXhsn1rROL1FQXXsc10T95KlM0Wp5VHYSUgr5TAjsRRXELjVulc4+/UZSSI/DfeAwtjTAAttwvAluX+0ZFixb7lrM4NYCxRoI9C8GijJGN9oYiymDWeJxQ+XmDXSFH8SeJ2An74FTx9MuunzbFl64xbT7+Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nO4ZMsaw; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nO4ZMsaw"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-93f64ae67dbso898715241.1
        for <chrome-platform@lists.linux.dev>; Sat, 17 Jan 2026 11:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768679112; x=1769283912; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IUH5YLlwfZi0OdbE0v9gLIiwvyrwpkrw6SV78GoWRsU=;
        b=nO4ZMsaw/Icw2wijLxdfPtk6yBiodDjcxtc51bHZx/9UoTZVHJiiDjO3ZixpnrsNmi
         Q7nsR0jAgYdAOK2in1ztBja4J97jDAaA2DABke2drni8KQraH4nHC026S4J0y/rKkLTw
         CnTbBsFGtpG9MRXpdPR5z99MqdmxfODgDqcD9tabaGjKLf9SVZHpMaWM33i+QR+MJUuY
         RKfPzWp5Tn4ithOxj2ffQDEnIRAAWW/p9ZFtgQXTNZroKi7WDMITsbAxxJ0/blwLp3nP
         bD6ees0Wsosuh8xwUKnDH9mIGqsRWWU8a1puNFR4u6/WsFWUH+M7csxi9rzBaP0aOtuI
         /lUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768679112; x=1769283912;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IUH5YLlwfZi0OdbE0v9gLIiwvyrwpkrw6SV78GoWRsU=;
        b=rTi6/DymIxJt4nlRicRTgtIrboVGuilsar1nLzVFYBWHHCLAsuiH6zRzlzDXOekYHe
         55XMziT4ADqpgpluzGA7+9pT9JHETGM8Kzo2EqzRyCtooRc1j2D0CrGNAtlSbFwgyp6z
         RJlRVtQqAV/I1wRmbnJmfOnPgRRjh6Q9TaCPwUXvopFF2izNK8XZgU3kuR7Ui+7l3v7o
         xK9LjWYtfQ3tlwUzrvgmhXWq/WVmGsCzbvIUSyRrZYNQM3u1TcpjGMVX1I7KQOljrJi5
         xxCUcptGK12Qax3POF4k039iZkyMS//h7+/4Tqex8riHIHp7r7wlaQTeWkgLgC22fA6b
         Eb/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0HJ2uElNhbdfAqNdY9mwdGeB8Wc0prwLcIeZcMyQWI6PJOAon/XL4Wrh0UiPRmSAAfuVu72xX8jRfgmaOdpc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3qrQ94SzCT/0/8yB4x9w2g3usaGQEUFMId+rTBB21/Cqg8s21
	7rYHwKOJp6xQYfHFGA1IsXVcXH3elnTg8xXAjtr5xApy5U5vfAVa88HX
X-Gm-Gg: AY/fxX6RBcqsNcmNJZURawXPMu32RGVyMe3tUiFMep/lhrhbHRB2pwGKXlxDJB2/mKf
	wSjVd6tJ9m2FXr/WSONkoJ9CZcBrcCiFCh2UWFxEsRgVE0992Eb9KJc+baF4Dg/1MORXeT1/HXG
	0AttHlC66GQ5ErUmDrDB7pqUSRsu44ta75W/HhkwFHIvPch8JGq9w2E0cE4qB8Dmdiq4CCuy304
	lu+E+24Zmas/E+4Utr1isl2a4dXY+vKVGcU4YM34A21AmTfIKV7ymwgk3jUqmfYSB3eXlxk7Un7
	VpT9UU+vlajqd/ZUDNQ7MKavdpVvot18SZP/Y1vyUJzd74ysOiWFYR8dMoZDwwHDpgGkk0DIP5U
	nAoB6k5mpJsBEhqnuBiBhlNa7CvFsgVbLLP9fjnu+oky/INY3mKdNn8KqchiJ/2ExJIjDVXVdLP
	LpRQ==
X-Received: by 2002:a05:6102:e08:b0:5ee:a0de:65d5 with SMTP id ada2fe7eead31-5f1a720aa52mr1737315137.41.1768679112408;
        Sat, 17 Jan 2026 11:45:12 -0800 (PST)
Received: from localhost ([2800:bf0:82:11a2:7ac4:1f2:947b:2b6])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-947d03c2861sm1785523241.3.2026.01.17.11.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Jan 2026 11:45:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Jan 2026 14:45:04 -0500
Message-Id: <DFR4EZFDOSJS.2U76CKFU7TVT2@gmail.com>
Cc: "Kurt Borja" <kuurtb@gmail.com>, "Andy Shevchenko"
 <andriy.shevchenko@intel.com>, "Lars-Peter Clausen" <lars@metafoo.de>,
 "Michael Hennerich" <Michael.Hennerich@analog.com>, "Jonathan Cameron"
 <jic23@kernel.org>, "Benson Leung" <bleung@chromium.org>, "Antoniu Miclaus"
 <antoniu.miclaus@analog.com>, "Gwendal Grignou" <gwendal@chromium.org>,
 "Shrikant Raskar" <raskar.shree97@gmail.com>, "Per-Daniel Olsson"
 <perdaniel.olsson@axis.com>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 "Andy Shevchenko" <andy@kernel.org>, "Guenter Roeck" <groeck@chromium.org>,
 "Jonathan Cameron" <Jonathan.Cameron@huawei.com>,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH v3 2/7] iio: core: Refactor iio_device_claim_direct()
 implementation
From: "Kurt Borja" <kuurtb@gmail.com>
To: "Andy Shevchenko" <andy.shevchenko@gmail.com>, "David Lechner"
 <dlechner@baylibre.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260106-lock-impr-v3-0-1db909b192c0@gmail.com>
 <20260106-lock-impr-v3-2-1db909b192c0@gmail.com>
 <5a953bf8-857e-4c67-be43-d60cc9b5a34c@baylibre.com>
 <CAHp75Vei0q4bJrfuv28B+f-JOn2DGBkE3LT3UX8TiTnmUgDw_w@mail.gmail.com>
In-Reply-To: <CAHp75Vei0q4bJrfuv28B+f-JOn2DGBkE3LT3UX8TiTnmUgDw_w@mail.gmail.com>

On Sat Jan 17, 2026 at 7:01 AM -05, Andy Shevchenko wrote:
> =D0=BF=CA=BC=D1=8F=D1=82=D0=BD=D0=B8=D1=86=D1=8F, 16 =D1=81=D1=96=D1=87=
=D0=BD=D1=8F 2026=E2=80=AF=D1=80. David Lechner <dlechner@baylibre.com> =D0=
=BF=D0=B8=D1=88=D0=B5:
>
>> On 1/6/26 2:06 AM, Kurt Borja wrote:
>> > In order to eventually unify the locking API, implement
>> > iio_device_claim_direct() fully inline, with the use of
>> > __iio_dev_mode_lock(), which takes care of sparse annotations.
>> >
>> > Signed-off-by: Kurt Borja <kuurtb@gmail.com>
>> > ---
>>
>> ...
>>
>> > diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
>> > index aecda887d833..3cf340208694 100644
>> > --- a/include/linux/iio/iio.h
>> > +++ b/include/linux/iio/iio.h
>> > @@ -664,31 +664,47 @@ int iio_push_event(struct iio_dev *indio_dev, u6=
4
>> ev_code, s64 timestamp);
>> >
>> >  void __iio_dev_mode_lock(struct iio_dev *indio_dev)
>> __acquires(indio_dev);
>> >  void __iio_dev_mode_unlock(struct iio_dev *indio_dev)
>> __releases(indio_dev);
>> > -bool __iio_device_claim_direct(struct iio_dev *indio_dev);
>> > -void __iio_device_release_direct(struct iio_dev *indio_dev);
>> >
>> >  /*
>> >   * Helper functions that allow claim and release of direct mode
>> >   * in a fashion that doesn't generate many false positives from spars=
e.
>> >   * Note this must remain static inline in the header so that sparse
>> > - * can see the __acquire() marking. Revisit when sparse supports
>> > - * __cond_acquires()
>> > + * can see the __acquires() and __releases() markings.
>> > + */
>> > +
>> nit: I think "attributes" would be more technically correct than
>> "markings" (since we are touching this).
>>
>
> The annotations is slightly better because these are for sparse and not f=
or
> compiler.

Hi Andy,

Yes, annotations also matches the Sparse documentation so I'll go with
that.


--=20
Thanks,
 ~ Kurt


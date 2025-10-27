Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A325E3277AF
	for <chrome-platform@lists.linux.dev>; Mon, 27 Oct 2025 19:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761593440; cv=none; b=BS+bRyda3Y/3/u0PI1Oj2QChN6hQABlrn31NrAlyo84TN3GsnnH0yTHqSEHMy93wSzeKSfPz//aR903PNYdJZ6f8O+BzqYiRNEIUUpIShXvBsIZLyF4WKP5g3BvwY5rMj2X1O0emDkjb0PG7OHs+ig6VNBPHIuWzjjBhH59WuOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761593440; c=relaxed/simple;
	bh=Nw/EC4BDxEdLzlg8/9tOSmc+lQtWTOG1wUVvZBCUOO4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pX1YnUhcvXBiv+5c0uZFHjBY3BYqk+zDPAGyb432kRp7IeWQ8fTJE3FTDcnr9Dm3Stzg690WxbP3iJWhMSzbdNUFO5V+DJ+YekbMuRZTlZEXNjyHQj3QL/rJQlyx/9f4N+pGYg3luTEx+9mhbvDByLXHSxJzpFgvRNRSMXeMd0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CY5lTM2c; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CY5lTM2c"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4298a028de6so3100068f8f.0
        for <chrome-platform@lists.linux.dev>; Mon, 27 Oct 2025 12:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761593436; x=1762198236; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfEgFrMFSQT2jieK7pepMP8G7R1y/5//r9L5wGXCKUI=;
        b=CY5lTM2calbouB23OeyFBhYlZJf1uX0Sobwn+JJn9pbQk+MXnziUpSEaB3W6rqSRB4
         nbPv/S4ShXTV/kl8ObuqFXvh7fSHUsQP2+WlXUEOCWiCH1r62flRmEP5YY3zQxMIdzJC
         Iu7tMlRHlOq0oFW7nPjc2UrAAc4bEGRXzG13MhP1xrz64RP1ACloJaf67gwcy4Ix0eM5
         X9Wb5BEyt1rW3h71Osv7OT4SAcOar2FB2/hE4f3ezb5B9/8AiOqDu4P198KKE2GMhpwE
         ldDyxqC9XxdMlEIdbkw7d/d7Kz1adSoom8J1ca7bc+sYTp2VTqtXHQAH1WmoHNIsGaXf
         kSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761593436; x=1762198236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sfEgFrMFSQT2jieK7pepMP8G7R1y/5//r9L5wGXCKUI=;
        b=ucSSin7r0C39VkVg55o+Nz2cvQluCIDgcceJ/C6fVDsR4lP8egM+KlsIFQO+DePBzo
         rMbPqdDQnftKv1hBVKizL6xSTYW5PyNkhn2rR8mOVgzmtPo7xyXAWBVhYlDO+kqUs8gs
         cboYy+6fxkmwTeKZuvsh8hDO4xML3OXP9udlMJNpoj9xjxDNydI2VdnN3zS1mf8tR3AD
         tySarWGOU903wrrMiW5XjEJC7nyeRkKh4pE50kRjnWuUjjdYxNM7JVDwBTWNWMbdTJXT
         yRrMUxQwJXe4or9J3hNvyO/pndE2FwzqfeKk9ddk/nRtFQpBv11OTvYYfJLGnbTLdQ8y
         1eRA==
X-Forwarded-Encrypted: i=1; AJvYcCWB6ztQs2bqE4/EHz8OUUiGfFzzinMzCt6etpfmnuVe+7V9n4r63ufYt4yvVazbcatTZsSsGVzcKxUPBTojPq0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGQIh6ab9S4b/DpsrI98hppDTOO5rAs8pj9oTAhS+9F9T9LHwF
	vzy4kTAPNsrK9F8KGQm6V9EZtx8pAeUQE64uKqEGhJch4kIUaW2nRDJK
X-Gm-Gg: ASbGnctSzc+pMKEUpbN2eXz9b0Zs/vzL3HbWYZLjeqvlBl17G+za6VVCIu4kZxnBQ5b
	DZVma7r0ffX2yiWbchWVAd7EhQQq93fYH7apx77rhjoC9Y+z7V91S1MkhsVivLlV50KCbmflVCA
	i0zI8zDsg1HSKzDKMOtOTUxSqiONn1GZ6ESEd0ahDW/J4WWKZUqUMf+E5bryQsr1hs/BE5jNVSi
	GMNL5e6R6eIaNGeRjXvYpmMj/QJxxP7TKNvB2QHQA3+Cmx2Fbom2fh3E8uOY+i5+YCpEWJGJULg
	eqGRSuj1/CUhPKlnUXUyb1bAWpaLlCpHHsTIZ2/xxJOonMzqAmh4Gv+oGwAUP/Atat3PCJJA1T0
	hu5jH9ffWeeNUAFqziW1+MGjEy/D75k5BPR8yFUISGdTSTjm8seyG/kKHvOqVQTjAuM/EwyrrAf
	LTWYZrrBMdggDXIhMN9is16/12e4q+DJqYDi6Bh9VWoJftwa0kU8BO
X-Google-Smtp-Source: AGHT+IGtEr+9CIcpzVVArHnTXR3tT6CiV2LiHYXcwwmfckLKMvIkaTwS1E1UtslWxI222jO5QieSoQ==
X-Received: by 2002:a5d:5f54:0:b0:425:70cb:9ba8 with SMTP id ffacd0b85a97d-429a81b1f42mr540100f8f.1.1761593435800;
        Mon, 27 Oct 2025 12:30:35 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952e3201sm15950022f8f.47.2025.10.27.12.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 12:30:35 -0700 (PDT)
Date: Mon, 27 Oct 2025 19:30:33 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-iio@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, Jonathan Cameron
 <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich
 <Michael.Hennerich@analog.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
Subject: Re: [PATCH v1 2/6] units: Add value of =?UTF-8?B?z4A=?= *
 =?UTF-8?B?MTDigbk=?=
Message-ID: <20251027193033.69728215@pumpkin>
In-Reply-To: <20251027143850.2070427-3-andriy.shevchenko@linux.intel.com>
References: <20251027143850.2070427-1-andriy.shevchenko@linux.intel.com>
	<20251027143850.2070427-3-andriy.shevchenko@linux.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 27 Oct 2025 15:34:51 +0100
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> There are a few drivers that want to have this value, and at least one
> known to come soon. Let's define a value for them.
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/units.h | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/include/linux/units.h b/include/linux/units.h
> index f626e212d4ca..82bdc2041328 100644
> --- a/include/linux/units.h
> +++ b/include/linux/units.h
> @@ -21,6 +21,9 @@
>  #define PICO	1000000000000ULL
>  #define FEMTO	1000000000000000ULL
> =20
> +/* Value of =CF=80 * 10=E2=81=B9 */
> +#define PI	3141592653LL

Is that the right value?
IIRC the next digits are 58979 (I used to know the next few as well)
which means it should be rounded up.

	David

> +
>  /* Hz based multipliers */
>  #define NANOHZ_PER_HZ		1000000000UL
>  #define MICROHZ_PER_HZ		1000000UL


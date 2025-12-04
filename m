Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6DE344032
	for <chrome-platform@lists.linux.dev>; Thu,  4 Dec 2025 17:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764869641; cv=none; b=hPhMcFoB9PpVn19/ANjG7ps28ct/LIzASAi7AhhoQPto9MLQCduiallGyX4JnrWrDqKbTU6KIOu0siHfdBbTloSQoQJkwkxEtHLgh/X4Yl0dlQAvk+S0VUj3DtNYouxV86ZR8HuzgZIbp/dByleUAkdP6+zbJ6f9xfPbQnkh+fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764869641; c=relaxed/simple;
	bh=e7sfty3yRlUODBxJz+PpxClJYLIPv1iuD6tUC8QfWQk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=sO3VilfDAjfH7+onv5NtiwXem8wqMeLYEDplIOxd8KoQ1iSVhiQNvKxPAUj1/MSSNvKLkQTY3BbL07xaKVrEN/4VjACAQrmol+BeKFh7AuHTgOyOoC9YwTkcG+2osXa8Camc2YDbRuhWhjktx7S+seCbO/tOhBilggGuLpbs9ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DikyWDxk; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DikyWDxk"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-55b302b8369so824698e0c.0
        for <chrome-platform@lists.linux.dev>; Thu, 04 Dec 2025 09:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764869638; x=1765474438; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NOkTIDR+TWpIaxfl02NyThkY1v6gZKg13N/SLcRcC4c=;
        b=DikyWDxkWkV4UvT5ISBufJ/HZgiP0xNWWHbWfj8BdFoFKnYMdT7nopzMu6hPZVoZ3z
         YCzJPYaW3PC5RJ/gvpNEx64iM6r3xMKYvoBQZZ99tMiqadVcormBw/BKDWkdnvmDk/c6
         h6MCrMC3j8azW/0tYJRAk+gwbV23J7hp7iJ4k49W5dq2bJGgdBp2M/a5sKOj+CCBAlcF
         DWeoq5RhKHYs7/UUgalLE0EAQYH8dwngXUAv0V76fupMlFWo6uPTCmsejh1TTKR0buPH
         h2x16fu1Y0EH6G/GICiYAVQYwn+KLh6/3kShq8mLKf37zgUfCZxSgJGdORXiiBoMqpUA
         ctPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764869638; x=1765474438;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NOkTIDR+TWpIaxfl02NyThkY1v6gZKg13N/SLcRcC4c=;
        b=k51dvN0U2nxfuWfoJJWCLuVoNrFkXsYR8ubp1bHqggOzG8YNdwnXmDPVDeUjb46Fyl
         QtLoZ/EmD0j4n39G7LcbZzh3kCZVpvIdaPrIUjix9nDQeFySE6V5qQnqIFS0EJjn6l9e
         X2jb5DBdE1rl+7LHraRKqUoPQJTX2/ivHsQkhsk72T4jt1ilZu6fNIiG7qgGGzQYOtcC
         tID9ZPTFYVuX1oOEjctwG/i7ysuQX0sTLxxEsyWm5saloPBWiZxKKPj3pUdtk9nPESsx
         ttTuidsVkGXrDoSF22E50dRjtXKslkXEwQZwbscVDV3bULCTd5YWjIzKe3BUkmokZjGG
         Dgpg==
X-Forwarded-Encrypted: i=1; AJvYcCUrZYqNU8HU+dFvE9BPNB3c7T2FmmWJH//pEGLkKUHbBrSYB1ayAWCniVOlh4Mqo4SMikOSgW4HHnjRG7BCjug=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz761gF/A86OdBsch49Gq9fJc7QbcHW+ng/b/xdZ/IPA4RlJFxr
	+O7QeMijLTTeXDqwYy4DUjetlAwVm7BKZkaPs97Buyj4UTh+WFm6pR07
X-Gm-Gg: ASbGncu/j64SnZGX4eDtHqdtHO/sGLdm3pHPyCgWbGO+wHra/SOctxtReYjh5BgKAEr
	Nwc7q5OkWZJU8Vr9bvO+8IMHGqvPjC9g13mvKwNHMhHI7+Npi+VUD0XlhaenTakK6D1YWUYFkAV
	JtxNUyoe9CTMUm1wiwIvZqC2A16M+AbIOSMfUWadBwu9vhAPAd1qAifyMLUcrAQWiZbeGJxuMAg
	sJ8fWznmWcxBq1+8DUgrqyMTkYeOqE79DWjUWO0vXNhtlE9RHS4VNmSLryFOxSl08KmvGHLCc8r
	n3qg7a+1qauVIx1+oxMb4W5nribcga/6UN39ArmCihUXeefKROp0PmDYPhAc8jnocGCqp2Bb97Z
	UQ+VieMUSNgBO/pmOvx7A2OET51WQtDtVx4tzE5hzKtwCossbbSqkDFXO+guNMuyfOVct6Tqi7D
	0oMRH8Wg==
X-Google-Smtp-Source: AGHT+IGlqYuc0MrdtBQVsuewSDNftJnQO6IYdcPyj5E2cCkLcpeZ4pRP4rTMgDOr8UY0XIwiv6cDqg==
X-Received: by 2002:a05:6102:5706:b0:5df:bd66:7b76 with SMTP id ada2fe7eead31-5e506882463mr1639471137.17.1764869638606;
        Thu, 04 Dec 2025 09:33:58 -0800 (PST)
Received: from localhost ([2800:bf0:4580:3149:7d4:54b1:c444:6f2f])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5e5107e7677sm955060137.6.2025.12.04.09.33.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 09:33:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Dec 2025 12:33:56 -0500
Message-Id: <DEPM2M0JZVLR.D8R992OGRBMD@gmail.com>
Cc: "David Lechner" <dlechner@baylibre.com>, =?utf-8?q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>, "Andy Shevchenko" <andy@kernel.org>, "Guenter Roeck"
 <groeck@chromium.org>, "Jonathan Cameron" <Jonathan.Cameron@huawei.com>,
 <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <chrome-platform@lists.linux.dev>
Subject: Re: [PATCH RFC 0/6] iio: core: Introduce cleanup.h support for mode
 locks
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
 <77ca77847511e67066a150096a7af2fb84f1f25f.camel@gmail.com>
In-Reply-To: <77ca77847511e67066a150096a7af2fb84f1f25f.camel@gmail.com>

On Thu Dec 4, 2025 at 9:36 AM -05, Nuno S=C3=A1 wrote:
> On Wed, 2025-12-03 at 14:18 -0500, Kurt Borja wrote:
>> Hi,
>>=20
>> In a recent driver review discussion [1], Andy Shevchenko suggested we
>> add cleanup.h support for the lock API:
>>=20
>> 	iio_device_claim_{direct,buffer_mode}().
>
> We already went this patch and then reverted it. I guess before we did no=
t had
> ACQUIRE() and ACQUIRE_ERR() but I'm not sure that makes it much better. L=
ooking at the
> last two patches on how we are handling the buffer mode stuff, I'm really=
 not convinced...
>
> Also, I have doubts sparse can keep up with the __cleanup stuff so I'm no=
t sure the
> annotations much make sense if we go down this path. Unless we want to us=
e both=C2=A0
> approaches which is also questionable.

I think if we add iio_device_claim() or whatever the final name may be,
we can annotate that instead with acquires(&mlock) and maybe it could
work?

I will test that.

>
> - Nuno S=C3=A1


--=20
 ~ Kurt


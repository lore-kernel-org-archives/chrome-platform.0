Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA5D2C80
	for <chrome-platform@lists.linux.dev>; Sat, 20 Aug 2022 15:05:50 +0000 (UTC)
Received: from [192.168.0.105] (unknown [136.169.224.60])
	by mail.ispras.ru (Postfix) with ESMTPSA id 90E0540737B7;
	Sat, 20 Aug 2022 15:05:36 +0000 (UTC)
Message-ID: <7d4dd8009a777a7d32f4872dc0285878dbbb91b8.camel@ispras.ru>
Subject: Re: [PATCH] platform/chrome: fix double-free in
 chromeos_laptop_prepare()
From: Rustam Subkhankulov <subkhankulov@ispras.ru>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Benson Leung <bleung@chromium.org>, Dmitry Torokhov
	 <dmitry.torokhov@gmail.com>, chrome-platform@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Alexey Khoroshilov <khoroshilov@ispras.ru>, 
	ldv-project@linuxtesting.org
Date: Sat, 20 Aug 2022 20:05:13 +0300
In-Reply-To: <YvnS7IKr/9VhffHX@google.com>
References: <20220813220843.2373004-1-subkhankulov@ispras.ru>
	 <YvnS7IKr/9VhffHX@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2022-08-15 at 05:00 +0000, Tzung-Bi Shih wrote:
> Alternatively, I would prefer to fix the double-free by setting
> `i2c_peripherals` to NULL after [1].

Since 'cros_laptop->num_i2c_peripherals' is assigned with nonzero value
(otherwise the code on 'err_out' is not executed), setting=20
'i2c_peripherals' to NULL after [1] will cause dereferencing of=20
NULL pointer in chromeos_laptop_destroy() at [2].=20

[1]:
https://elixir.bootlin.com/linux/v5.19/source/drivers/platform/chrome/chrom=
eos_laptop.c#L787
[2]:
https://elixir.bootlin.com/linux/v5.19/source/drivers/platform/chrome/chrom=
eos_laptop.c#L860

> After a quick glance, I found an invalid memory access at [2] if
> `i2c_peripherals` is NULL (see [3]).=C2=A0

After applying the patch, there will be no invalid memory access at [2]
if 'i2c_peripherals' is NULL, because in this situation=20
'cros_laptop->num_i2c_peripherals' is zero and there is no single=20
iteration of the loop.

> Or was the double-free issue
> discovered by
> some static analysis?

Yes, it was discovered by SVACE static analysis tool.

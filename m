Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C7119F40B;
	Sat,  5 Sep 2026 17:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788627640; cv=none; b=Vl7f0OxqHvRMEEa3jJQ0+lo/17hvxwmHlO9t7ze2KSYVwq2caTXUKLQTOTcloIdvRLL1/4DCe14BQ6C3yElhSpw4hJIJ4RWOG6tZXyz5oIFbhpW1gouS9bI3g6MOTT4CeYxtQqz5vo32ImiEdarZbgEh8ZgjUCfStcbai8jMmts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788627640; c=relaxed/simple;
	bh=E/YGINKQN6qYpKUyueJ6FW3LOWWNUixkb9aSlUhjNUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p5z6+9SIKRl7EFHAx+lQZD0MFjTL+jbkX6b/8GH0Zs1E6izS5h/RYhzu6/Z1Nh8RU8Yj2tYXo6AKJcTAtwc0K2cKziDpQOY3AgwiQcBi0QHDLA4K0rjwPD/QmQAA1JXFh+A+MUG5joVyY6UUZqk2+Biuzzw+GeJYi/bUXigLx5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZjHc1COE; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZjHc1COE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=uE1bfZDHcyY5plVwygK9lfh6pF+C+egIj3iW5kUpjlc=; b=ZjHc1COEZ/SFnlHLWiM4vAq6gV
	Khs3dVrY94i4U1F4Br8JobLbOvWcdpoAICVdxBGv74AMEtkTD9DKgdw/n7xhVtmtgm8cpGm2aUHZz
	vi+DVnmN6Ak59/CwAOlcqTvqp5oHvQ6h4gxw0w1LMkQ3/EztdA2q7AZc9miqs0zVMNZgrAIDNMCQj
	OkA3PYDlRyIRqD4hp9teTr5FdbzUEQSv/vyPO8mJEYdXq/cfEQ24PmkOcyC7KAyRAyg0m1atZFjq2
	RMhr3/YiVdvVAWJzbxymLVPHrEpB8aDrUZnw7pAWRUCvMD9/ulXkgAB+VYn4ci3z3OfovRutIoQIa
	bnlYCBVA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2tkl-00000004HEJ-2c7S;
	Sat, 05 Sep 2026 17:00:31 +0000
Message-ID: <369264c7-341e-4173-a8e9-c0ae77556238@infradead.org>
Date: Sat, 5 Sep 2026 10:00:17 -0700
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: ioctl-number: Point the 0xEC row at
 cros_ec_chardev.h
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev,
 =?UTF-8?Q?Iv=C3=A1n_Ezequiel_Rodriguez?= <ivanrwcm25@gmail.com>,
 linux-doc@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
References: <20260905102754.43160-1-kmehltretter@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260905102754.43160-1-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/5/26 3:27 AM, Karl Mehltretter wrote:
> The 0xEC entry points at drivers/platform/chrome/cros_ec_dev.h, which
> commit 5e0115581bbc ("cros_ec: Move cros_ec_dev module to drivers/mfd")
> moved; the ioctl numbers now live in
> include/linux/platform_data/cros_ec_chardev.h.

and have done so for a long time...

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> 
> Point the row at that file.
> 
> Fixes: eda2e30c6684 ("mfd / platform: cros_ec: Miscellaneous character device to talk with the EC")
> Assisted-by: LLM
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  Documentation/userspace-api/ioctl/ioctl-number.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
> index 2fc53093752d..32c0d08e92e4 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -399,7 +399,7 @@ Code  Seq#    Include File                                             Comments
>  0xDD  00-3F                                                            ZFCP device driver see drivers/s390/scsi/
>                                                                         <mailto:aherrman@de.ibm.com>
>  0xE5  00-3F  linux/fuse.h
> -0xEC  00-01  drivers/platform/chrome/cros_ec_dev.h                     ChromeOS EC driver
> +0xEC  00-01  linux/platform_data/cros_ec_chardev.h                     ChromeOS EC driver
>  0xEE  00-09  uapi/linux/pfrut.h                                        Platform Firmware Runtime Update and Telemetry
>  0xF3  00-3F  drivers/usb/misc/sisusbvga/sisusb.h                       sisfb (in development)
>                                                                         <mailto:thomas@winischhofer.net>

-- 
~Randy

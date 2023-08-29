Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B37A47
	for <chrome-platform@lists.linux.dev>; Tue, 29 Aug 2023 03:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7211CC433C7;
	Tue, 29 Aug 2023 03:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693278562;
	bh=N7jWe3j6XOtjLkaxY7ui5Esh2q5j2JyJskPmlck1d0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GQvbgAQ0H8IiVMWMELo4/mGJnYg7DtujfnQPPlgskzP9ZiBLvM4PY5pVAaMevfuwS
	 jIrMTNMECfDSVLrDm92yKpUWPk+ecFKUmhkPnH6E911fqu2Y2HM5tNLgIb24BBjyc/
	 1PbAiXHZ/0ag7m8qb2YeZUCeFJszZk6ERx3ts2uEAgqXRWc/MLVUFRt+X/vzaKtyQy
	 cYDFmHvGNfBs48AX+v/18uSctrPXdhOsjZqMUiLxlh/0flb6BwFx+gyitdiiBTi3nN
	 2iONo687DaNlUYrc+89H6gnwgGufIBzZJPXzvvNLvZrzni4FDBS7Z6Zz7Su7oAKH3x
	 cuuEOaDXqwcWw==
Date: Tue, 29 Aug 2023 11:09:18 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: bleung@chromium.org, groeck@chromium.org, lars@metafoo.de,
	chrome-platform@lists.linux.dev, gwendal@chromium.org,
	linux-iio@vger.kernel.org, dianders@chromium.org,
	swboyd@chromium.org, stable@vger.kernel.org
Subject: Re: [PATCH] iio: cros_ec: fix an use-after-free in
 cros_ec_sensors_push_data()
Message-ID: <ZO1hXo7J02w8sv0T@google.com>
References: <20230828094339.1248472-1-tzungbi@kernel.org>
 <20230828115359.054dc13a@jic23-huawei>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828115359.054dc13a@jic23-huawei>

On Mon, Aug 28, 2023 at 11:53:59AM +0100, Jonathan Cameron wrote:
> Can we use iio_device_claim_buffer_mode() here?  I believe that has the right handling
> even though I don't think we've used it to protect iio_push_* before.  Normally it's about
> enforcing we stay in the mode if the read out of a channel needs to be handled differently
> in a read_raw() callback.
> 
> if (iio_device_claim_buffer_mode(indio_dev) < 0) {
> 	/* Not in buffer mode so fine to drop out - we got -EBUSY*/
> 	return 0;
> }
> //Otherwise mlock is held - though that's an implementation detail all we care about is we can't exit buffer mode.
> ...
> iio_push_...
> iio_device_release_buffer_mode(indio_dev);
> return 0;

Ack, fix it in v2(https://patchwork.kernel.org/project/linux-iio/patch/20230829030622.1571852-1-tzungbi@kernel.org/).

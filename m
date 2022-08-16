Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725C31C32
	for <chrome-platform@lists.linux.dev>; Tue, 16 Aug 2022 05:08:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F9A6C433C1;
	Tue, 16 Aug 2022 05:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660626532;
	bh=EkH4HoC5GYbUkWQltFaYg7uW98fpm2YY+hcM9wgH/2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VcVGd3nXbEK3CtsS7RzJIxS4mgZeBgCA1SqOJZwqrD47/MQlHuy++Jreh7QtiFuv7
	 /tV3B5S4Hje+O0KBaJDyxMEKiIEjNHNto1aGlMkIq8mVJXsLs6zZsEKBpI+SGWy3Ac
	 tb1cjTgNjiNIHV5v98nK5nxa2p6rLNDsvievBFbXkrckCsJpQT/I4EezEMUGj2uIXK
	 h66AlVbX28qKlkmAz/RFcdk6mBW0mn3Jj2wbRLqoX6P44HL0f+1KDKv9P0AuZgl1tq
	 /6Esdx/RjfovnSIuuBrsIHNUHBbtHi0QeVD7yPZhzMDI2SmVtzOu9T9CoSpCOxTbAf
	 pUBAo4kOiwXpw==
Date: Tue, 16 Aug 2022 05:08:47 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Prashant Malani <pmalani@chromium.org>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	bleung@chromium.org, Daisuke Nojiri <dnojiri@chromium.org>,
	"Dustin L. Howett" <dustin@howett.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Xiang wangx <wangxiang@cdjrlc.com>
Subject: Re: [PATCH v5 1/7] platform/chrome: Add Type-C mux set command
 definitions
Message-ID: <YvsmX9Fh5mXwQYx9@google.com>
References: <20220815063555.1384505-1-pmalani@chromium.org>
 <20220815063555.1384505-2-pmalani@chromium.org>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220815063555.1384505-2-pmalani@chromium.org>

On Mon, Aug 15, 2022 at 06:34:17AM +0000, Prashant Malani wrote:
> Copy EC header definitions for the USB Type-C Mux control command from
> the EC code base. Also pull in "TBT_UFP_REPLY" definitions, since that
> is the prior entry in the enum.
> 
> These headers are already present in the EC code base. [1]
> 
> [1] https://chromium.googlesource.com/chromiumos/platform/ec/+/b80f85a94a423273c1638ef7b662c56931a138dd/include/ec_commands.h
> 
> Signed-off-by: Prashant Malani <pmalani@chromium.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

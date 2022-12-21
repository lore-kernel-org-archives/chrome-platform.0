Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D7B1FB3
	for <chrome-platform@lists.linux.dev>; Wed, 21 Dec 2022 07:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC7A9C433D2;
	Wed, 21 Dec 2022 07:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1671607733;
	bh=cRF0ar5xp1O4E9/pzfz6d06fa4kFJnLgBYrOdMd0uiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=he4Iyu4JlNtCB7ZxQFKuVG4TQzlGi6l4zzRS4oor133YItAYFQmxHJDM8FR95eJFa
	 USBviq1kCtMdCWQb+Sd3GDLr+aY2c6uDd6MEKiDXLgitcg7R0Q0Qb1P+zte1jGrQ2N
	 CtgIHAUCaaAQ2zfyfBfCs+moCI+7lIMh8R5FLl38=
Date: Wed, 21 Dec 2022 08:28:50 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Joe Wu <joewu@msi.corp-partner.google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
	"Dustin L . Howett" <dustin@howett.net>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Xiang wangx <wangxiang@cdjrlc.com>, linux-input@vger.kernel.org,
	Prashant Malani <pmalani@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Furquan Shaikh <furquan@chromium.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Derek Huang <derekhuang@google.com>,
	chrome-platform@lists.linux.dev,
	Guenter Roeck <groeck@chromium.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>
Subject: Re: [PATCH] cros_ec_keyb: Add 3 buttons for monitor function
Message-ID: <Y6K1sjCTM2Z6d4iU@kroah.com>
References: <20221220080226.17904-1-joewu@msi.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221220080226.17904-1-joewu@msi.corp-partner.google.com>

On Tue, Dec 20, 2022 at 04:02:26PM +0800, Joe Wu wrote:
> Add 3 extra buttons: 'brightness up', 'brightness down'
> and 'screen lock' to support monitor manipulating function.
> 
> Signed-off-by: Joe Wu <joewu@msi.corp-partner.google.com>

Note, this is a "fake" email address, please always use your real one
and not a google-gerrit-assigned address.

thanks,

greg k-h

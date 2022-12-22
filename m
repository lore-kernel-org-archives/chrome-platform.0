Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A611FB1
	for <chrome-platform@lists.linux.dev>; Thu, 22 Dec 2022 05:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 558A9C433EF;
	Thu, 22 Dec 2022 05:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1671688273;
	bh=gztgrP+lGDWx+pboL1x3QVUonCOW/rqRT649jwqAW8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wTBUgATBlzR4xjtGWjCda5bOqbz70n36sGPs0Sv4hnetKghJHkoG2POwXn8COGtLy
	 yT6KHhuze8Ojk9lHtkzXCJoCncwrdvWSrZ0HvrIkdBeQbLvuWoywk/B8Soke8PL8QB
	 lqCeYTRFd/2pzI4AW50W6X/5C+AEBfNfqmJc3I6o=
Date: Thu, 22 Dec 2022 06:51:10 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?B?am9ld3Uo5ZCz5Luy5oyvKQ==?= <joewu@msi.com>
Cc: Joe Wu <joewu@msi.corp-partner.google.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	"Dustin L . Howett" <dustin@howett.net>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Xiang wangx <wangxiang@cdjrlc.com>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
	Prashant Malani <pmalani@chromium.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	Daisuke Nojiri <dnojiri@chromium.org>,
	Furquan Shaikh <furquan@chromium.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Derek Huang <derekhuang@google.com>,
	"chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
	Guenter Roeck <groeck@chromium.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>
Subject: Re: [PATCH] cros_ec_keyb: Add 3 buttons for monitor function
Message-ID: <Y6PwTu2xWjjprBCR@kroah.com>
References: <20221220080226.17904-1-joewu@msi.corp-partner.google.com>
 <Y6K1sjCTM2Z6d4iU@kroah.com>
 <6fa20adbcc4b43f4947a52d50083eedc@msi.com>
Precedence: bulk
X-Mailing-List: chrome-platform@lists.linux.dev
List-Id: <chrome-platform.lists.linux.dev>
List-Subscribe: <mailto:chrome-platform+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:chrome-platform+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6fa20adbcc4b43f4947a52d50083eedc@msi.com>

On Thu, Dec 22, 2022 at 01:50:15AM +0000, joewu(吳仲振) wrote:
> *****CONFIDENTIAL INFORMATION*****
> 
> This email is intended only for the use of the person or entity to whom it is
> addressed and contains information that may be subject to and/or may be
> restricted from disclosure by contract or applicable law. If you are not the 
> intended recipient of this email, be advised that any disclosure, copy, 
> distribution or use of the contents of this message is strictly prohibited. 
> If you are not the intended recipient of this email, please notify the sender 
> that you have received this in error by replying to this message. Then, 
> please delete it from your system. Our Privacy Policy is available here 
> https://www.msi.com/page/privacy-policy. Thank you.

Now deleted.
